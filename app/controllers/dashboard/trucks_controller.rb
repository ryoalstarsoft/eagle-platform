class Dashboard::TrucksController < AuthenticatedController
  before_action :set_truck, only: [:edit, :update, :destroy]

  def index
    @trucks = current_vendor.trucks.is_available.order(:number)
    @trucks = @trucks.where(number: params[:truck_number]) if params[:truck_number] && params[:truck_number] != ''
    @trucks = @trucks.is_private if params[:truck_ownership]=="private"
    @trucks = @trucks.is_indie if params[:truck_ownership]=="indie"
    @trucks = @trucks.is_active if params[:truck_activity]=="active"
    @trucks = @trucks.not_active if params[:truck_activity]=="inactive"

    @trucks = @trucks.paginate(paginate_params)
  end
  
  def new
    @truck = current_vendor.trucks.new
  end

  def create
    @truck = current_vendor.trucks.create(truck_params)
    if @truck.save
      redirect_to dashboard_trucks_url, notice: 'Truck was successfully created.'
    else
      flash[:error] = @truck.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit

  end

  def update
    if @truck.update(truck_params)
      redirect_to dashboard_trucks_url, notice: 'Truck was successfully updated.'
    else
      flash[:error] = @truck.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @truck.destroy
    redirect_to dashboard_trucks_url, notice: 'Truck was successfully removed.'
  end

  private

    def set_truck
      @truck = current_vendor.trucks.find(params[:id])
    end

    def truck_params
      params.require(:truck).permit(:number, :is_owned, :is_active)
    end
end
