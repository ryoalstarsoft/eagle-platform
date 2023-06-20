module API
  module V1
    module Endpoints
      module Public
        class Status < Grape::API
          resource :status do
            desc "Return App Status"
            get do
              respond 200, { 
                status: "Up", 
                version: current_version, 
                current_api_user: serialize(current_api_user),
                supported_app_version: '1.0.0',
                deprecation_message: 'A newer version of this app is available in the App Store.  Please update to get access to the new features!'
              }
            end
          end
        end
      end
    end
  end
end