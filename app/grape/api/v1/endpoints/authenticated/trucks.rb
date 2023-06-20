module API
  module V1
    module Endpoints
      module Authenticated
        class Trucks < Grape::API
          helpers do
            def truck_params
              ActionController::Parameters.new(params).permit(:description)
            end
          end

          resource :trucks do
            desc "Show List of Trucks"
            get do
              respond 200, current_company.trucks
            end


            desc "Add a Truck"
            params do
              optional :description, type: String, desc: "Description of Truck"
            end
            post do
              truck = current_company.trucks.new(truck_params)

              if truck.save
                respond 200, truck
              else
                validation_error(truck)
              end
            end


            params do
              requires :truck_uuid, type: String, desc: 'Truck UUID'
            end
            route_param :truck_uuid do
              desc "Disable a Truck"
              delete do
                if current_company.trucks.disable( params[:truck_uuid] )
                  respond 200, true
                else
                  eazyo_error(402, "Truck cannot be disabled at this time.")
                end
              end

              params do
                optional :description, type: String, desc: "Description of Card"
              end
              desc "Update a Credit Card"
              put do
                if card = current_api_user.cards.find_by(uuid: params[:card_uuid])
                  if card.update_attributes( card_params )
                    respond 200, card
                  else
                    validation_error(card)
                  end
                else
                  eazyo_error(404, "Record not found")
                end
              end
            end
          end

        end
      end
    end
  end
end