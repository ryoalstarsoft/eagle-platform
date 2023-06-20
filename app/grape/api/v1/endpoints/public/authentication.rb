module API
  module V1
    module Endpoints
      module Public
        class Authentication < Grape::API
          
          resource :authentication do
            desc "Authenticate user and return user object / access token"
            params do
              requires :email, type: String, desc: "User email"
              requires :password, type: String, desc: "User Password"
            end
            post do
              email = params[:email]
              password = params[:password]

              if user = User.authenticate_credentials(email, password)
                respond 200, user
              else
                juicy_error(401, "Invalid Login Credentials.", "Unauthorized")
              end
            end
          end

        end
      end
    end
  end
end