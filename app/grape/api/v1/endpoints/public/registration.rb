module API
  module V1
    module Endpoints
      module Public
        class Registration < Grape::API
          helpers do
            def user_params
              ActionController::Parameters.new(params).permit(:first_name, :last_name, :email, :password, :phone_number, :device_token, :device_type)
            end
          end

          resource :registration do
            params do
              requires :first_name, type: String, desc: "User first name"
              requires :last_name, type: String, desc: "User last name"
              requires :email, type: String, desc: "User email"
              optional :phone_number, type: String, desc: "User phone number"
              optional :password, type: String, desc: "User Password"
              optional :device_token, type: String, desc: "Device Token"
              optional :device_type, type: String, desc: "Device Type: ios or android"
            end

            desc "Register a User"
            post do
              user = User.new(user_params)

              if user.save
                respond 200, user
              else
                validation_error(user)
              end
            end

          end
        end
      end
    end
  end
end