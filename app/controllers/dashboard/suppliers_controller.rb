class Dashboard::SuppliersController < AuthenticatedController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def index
    @suppliers = current_vendor.suppliers.is_active.order(:name)
    @suppliers = @suppliers.paginate(paginate_params)
  end

  def show
    @materials = @supplier.materials.includes(:material_type).order('material_types.name').paginate(paginate_params)
  end
  
  def new
    @supplier = current_vendor.suppliers.new
  end

  def create
    @supplier = current_vendor.suppliers.create(supplier_params)
    if @supplier.save
      redirect_to dashboard_supplier_path(@supplier), notice: 'Supplier was successfully created.'
    else
      flash[:error] = @supplier.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit

  end

  def update
    if @supplier.update(supplier_params)
      redirect_to dashboard_supplier_path(@supplier), notice: 'Suppplier was successfully updated.'
    else
      flash[:error] = @supplier.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    redirect_to dashboard_suppliers_url, notice: 'Supplier was successfully removed.'
  end

  private

    def set_supplier
      @supplier = current_vendor.suppliers.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:name, :email, :phone_number, :is_active,
                                       :address, :address2, :city, :state, :zip_code)
    end

end
