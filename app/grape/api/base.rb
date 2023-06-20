module API
  class Dispatch < Grape::API
    require 'action_dispatch/middleware/remote_ip.rb'
    use ActionDispatch::RemoteIp

    format :json

    mount V1::Base
    # if %w(development staging).include? Rails.env
    #   # require 'grape-swagger'
    #   add_swagger_documentation base_path: '',
    #                             # add_base_path: true,
    #                             api_version: 'v1',
    #                             hide_format: false,
    #                             format: :json,
    #                             hide_documentation_path: true
    # end    
  end

  class Logger < Grape::Middleware::Base

    def before
      Rails.logger.info "[api] Requested: #{parsePW request_log_data.to_json}"
    end

    def after
      Rails.logger.info "[api] Response: #{parsePW response_log_data}"
      nil
    end
    
    private

      def request_log_data
        req = Rack::Request.new(env)
        request_data = {
          method: env['REQUEST_METHOD'],
          path:   env['PATH_INFO'],
          token: env['HTTP_X_AUTH_TOKEN'],
          data: req.POST
        }
        request_data[:user_id] = current_user.id if (current_user rescue false)
        request_data
      end

      def response_log_data
        status, headers, bodies = *@app_response

        begin
          if ENV['API_DEBUG'] == "true" || Rails.env.test? || Rails.env.development?
            body = @app.call(env)[2]
            body = body.body if body.kind_of? Rack::BodyProxy
            body = body.first if body.kind_of? Array
            hash = JSON.parse(body)#["hash"]
            "code:[#{ hash['code'] }]  message:[#{hash['message']}]  data:#{hash['data']}"
          else
            "status: #{status}"
          end
        rescue => e
          "ERROR: #{e.inspect}"
        end
      end

      def parsePW(data)
        begin
          json = JSON.parse data
          json["data"]["password"] = "HIDDEN" if (json["data"] && json["data"]["password"])
          json
        rescue => e
          data
        end
      end

  end

  Base = Rack::Builder.new do
    use API::Logger
    run API::Dispatch
  end

  def self.routes
    API::V1::Base.routes.each do |route|
      info = route.instance_variable_get :@options
      endpoint = "/#{info[:version]}#{info[:namespace]}"
      description = "%-40s..." % info[:description][0..39]
      method = "%-7s" % info[:method]
      puts "#{description}  #{method} #{endpoint}"
    end
  end
end
