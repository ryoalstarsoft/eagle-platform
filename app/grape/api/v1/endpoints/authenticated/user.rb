module API
  module V1
    module Endpoints
      module Authenticated
        class User < Grape::API
          helpers do
            def user_params
              ActionController::Parameters.new(params).permit(:first_name, :last_name, :email, :password, :phone_number, :device_token, :device_type)
            end
          end

          resource :user do
            desc "Returns User info"
            get do
              respond 200, current_api_user
            end

            desc "Updates User info"
            params do
              optional :first_name, type: String, desc: "User First Name"
              optional :last_name, type: String, desc: "User Last Name"
              optional :email, type: String, desc: "User Email"
              optional :phone_number, type: String, desc: "User Phone Number"
              optional :password, type: String, desc: "New Password"
              optional :device_token, type: String, desc: "Device Token"
              optional :device_type, type: String, desc: "Device Type: ios or android"
            end
            put do
              if current_api_user.update_attributes( user_params )
                respond 200, current_api_user
              else
                validation_error(current_api_user)
              end
            end

            # desc "User Notifications"
            # get :notifications do
            #   respond 200, Notification.where(notifiable_type: "User", notifiable_id: current_api_user.id).map{|n| n.mini_json}
            # end

            # desc "Client Token"
            # get :client_token do
            #   respond 200, { client_token: Braintree::ClientToken.generate, customer_id: current_api_user.customer_id }
            # end
          end
        end
      end
    end
  end
end