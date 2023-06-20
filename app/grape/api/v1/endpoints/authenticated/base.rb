module API
  module V1
    module Endpoints
      module Authenticated
        class Base < Grape::API
          include API::V1::Utils::UserAuthentication::Active

          # Load all Authenticated Endpoints
          # mount API::V1::Endpoints::Authenticated::Trucks
        end
      end
    end
  end
end