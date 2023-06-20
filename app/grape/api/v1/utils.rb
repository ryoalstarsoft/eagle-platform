module API
  module V1
    module Utils
      BYPASS_AUTH_DEVELOPMENT = ENV['BYPASS_AUTH_DEVELOPMENT']

      module APIKey
        extend ActiveSupport::Concern

        included do
          before do
            error!( respond(401,"Unauthorized","Invalid or Missing [APPKEY]"), 401) unless valid_api_key
          end

          helpers do
            def allowed_keys
              @allowed_keys ||= Rails.application.secrets.allowed_api_keys
            end

            def valid_api_key
              return true if BYPASS_AUTH_DEVELOPMENT
              allowed_keys.include? headers['X-App-Key']
            end
          end
        end
      end

      module Defaults
        extend ActiveSupport::Concern

        included do
          version 'v1'
          # format :json
          default_format :json
          # content_type :json, "application/json"

          helpers do
            def current_version
              'v1'
            end

            def current_api_user
              @current_api_user ||= headers['X-Auth-Token'] && (User.find_by_authentication_token(headers['X-Auth-Token']) rescue nil)
            end

            def remote_ip
              env["action_dispatch.remote_ip"].to_s()
            end
          end
        end
      end

      module ErrorHandlers
        extend ActiveSupport::Concern

        def respond_with_error(message, status)
          error = {
            status: 200,
            message: {
              code: status,
              data: { error: message },
              message: "Bad request"
            },

          }
          error_response error
        end

        included do
          helpers do
            def validation_error(user)
              juicy_error(400, user.errors.full_messages)
            end

            def juicy_error(code, message, system_message='Bad request')
              error = {
                code: code,
                data:  { error: Array.wrap(message) },
                message: system_message
              }
              error
            end
          end

          # global handler for simple not found case
          rescue_from ActiveRecord::RecordNotFound do |e|
            Rollbar.info(e, "API [404]: Record not found")

            error = {
              status: 200,
              message: {
                code: 404,
                data: { error: Array.wrap(e.message) },
                message: "Bad request"
              }
            }
            error_response error
          end

          rescue_from ActiveRecord::RecordNotUnique do |e|
            Rollbar.info(e, "API [402]: Duplicate key violates unique constraint")
            message = e.message.split(/(DETAIL:\s+Key\s*)/)[2].split(/(\n)/)[0]
            message.gsub!(/[\(\)]/, '')
            message.gsub!(/\=/, ' ')
            message.prepend('The ')
            error = {
              status: 200,
              message: {
                code: 402,
                data: { error: Array.wrap(message) },
                message: "Bad request"
              }
            }
            error_response error
          end

          rescue_from Grape::Exceptions::ValidationErrors do |e|
            Rollbar.info(e, "API [406]: Invalid or missing params")

            error = {
              status: 200,
              message: {
                code: 406,
                data: { error: ["Invalid or missing params: #{e.message}"] },
                message: "Bad request"
              }
            }
            error_response error
          end

          # global exception handler, used for error notifications
          rescue_from :all do |e|
            Rollbar.error(e, "API 500: Error")
            if Rails.env.development?
              raise e
            else
              # Raven.capture_exception(e)

              error = {
                status: 200,
                message: {
                  code: 500,
                  data: { error: ["Internal server error"] },
                  message: "Bad request"
                }
              }
              error_response error
            end
          end
        end
      end

      module Responders
        extend ActiveSupport::Concern

        included do
          helpers do
            def respond(code, data, message="")
              {
                code: code,
                data: serialize(data),
                message: message
              }
            end

            def strip_protected_attrs(obj, options={})
              protected_attrs_re = Regexp.union([
                /^id$/,
                /\_id$/,
                /\_at$/,
                /^encrypted\_password$/,
                /sign\_in/,
                /^is\_admin$/
              ])
              file_attrs_re = Regexp.union([
                /(.*)\_file\_name$/,
                /(.*)\_content\_type$/,
                /(.*)\_file\_size$/,
                /(.*)\_updated\_at$/
              ])
              whitelisted_attrs = ['fb_user_id']

              response = {}

              attribute_hash = obj.is_a?(Hash) ? obj : obj.as_json(options)
              attribute_hash.each do |k,v|
                next if !whitelisted_attrs.include?(k) && k.match(protected_attrs_re)

                if match = k.match(file_attrs_re)
                  matches = match.to_a.compact
                  file_attr_name = matches.last
                  default_url = ActionController::Base.helpers.asset_url("#{file_attr_name}-default.png")

                  if obj.send("#{file_attr_name}?")
                    response["has_#{file_attr_name}"] = true
                    response["#{file_attr_name}_url"] = (obj.send("#{file_attr_name}").url(:large) rescue default_url)
                  else
                    response["has_#{file_attr_name}"] = false
                    response["#{file_attr_name}_url"] = default_url
                  end
                else
                  response[k] = v
                end
              end

              response
            end

            def serialize(obj, options={})
              return obj if ["String", "Integer", "Hash"].include? obj.class.name

              if obj.nil?
                obj = {}
              else
                obj = obj.to_a rescue obj
              end

              if obj.is_a?(ActiveRecord::Base)
                strip_protected_attrs(obj, options)
              elsif obj.is_a?(Array)
                obj.map{|d| serialize(d) }
              else
                obj
              end
            end

            def base_url
              @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
            end

            def default_api_image(type, name, scale=nil)
              return if name.nil?
              folder    = "/default/" + type.to_s.downcase.pluralize + "/"
              ext       = ".png"
              prefix    = type.to_s.downcase + "_"
              name      = name.downcase
              (base_url + folder + prefix + name + scale.to_s + ext)
            end

            def temp_api_image(type, file_name)
              folder    = "/temp/" + type.to_s.downcase.pluralize + "/"
              file_name = file_name.downcase
              (base_url + folder + file_name)
            end
          end
        end
      end

      module UserAuthentication
        extend ActiveSupport::Concern

        class_methods do
          def authenticate_api_user
            if BYPASS_AUTH_DEVELOPMENT
              @current_api_user = User.first
              return true
            end
            headers['X-Auth-Token'] && @current_api_user = (User.find_by_authentication_token(headers['X-Auth-Token']) rescue nil)
          end
        end

        module Passive
          extend ActiveSupport::Concern
          included do
            before do
              # authenticate_api_user
            end
          end
        end

        module Active
          extend ActiveSupport::Concern
          included do
            before do
              error!( respond(401,"Unauthorized","Invalid or Missing :access_token"), 401) unless authenticate_api_user
            end
          end
        end

      end
    end
  end
end
