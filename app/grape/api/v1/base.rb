module API
  module V1
    class Base < Grape::API
      require 'rollbar'

      include API::V1::Utils::APIKey
      include API::V1::Utils::Defaults
      include API::V1::Utils::Responders
      include API::V1::Utils::ErrorHandlers
      
      # Load all Non-Authenticated Endpoints
      mount API::V1::Endpoints::Public::Base

      # Load all Authenticated Endpoints
      mount API::V1::Endpoints::Authenticated::Base

      if %w(development staging).include? Rails.env
        # require 'grape-swagger'
        # prefix 'v1'
        add_swagger_documentation base_path: '',
                                  add_base_path: false,
                                  api_version: 'v1',
                                  hide_format: false,
                                  format: :json,
                                  hide_documentation_path: true
      end
    end
  end
end