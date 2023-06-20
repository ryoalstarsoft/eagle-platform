module API
  module V1
    module Endpoints
      module Public
        class Base < Grape::API
          include API::V1::Utils::UserAuthentication::Passive

          # Load all Non-Authenticated Endpoints
          mount API::V1::Endpoints::Public::Status
          mount API::V1::Endpoints::Public::Authentication
          mount API::V1::Endpoints::Public::Registration
          
          # Temporary
          mount API::V1::Endpoints::Public::Temporary
        end
      end
    end
  end
end