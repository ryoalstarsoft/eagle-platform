class Dashboard::Suppliers::MaterialsController < AuthenticatedController
  before_action :set_supplier
  before_action :set_material, only: [:edit, :update, :destroy]
  
  def new
    @material = @supplier.materials.new
  end

  def create
    @material = @supplier.materials.create(material_params)
    if @material.save
      redirect_to dashboard_supplier_path(@supplier), notice: 'Material was successfully added.'
    else
      flash[:error] = @material.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit

  end

  def update
    if @material.update(material_params)
      editable_redirect_to dashboard_supplier_path(@supplier), notice: 'Material was successfully updated.'
    else
      flash[:error] = @material.errors.full_messages.join(", ")
      editable_render :edit
    end
  end

  def destroy
    @material.destroy
    redirect_to dashboard_supplier_path(@supplier), notice: 'Material was successfully removed.'
  end

  private

    def set_supplier
      @supplier = current_vendor.suppliers.find(params[:supplier_id])
    end

    def set_material
      @material = @supplier.materials.find(params[:id])
    end

    def material_params
      if request.xhr?
        {params[:name] => params[:value]}
      else
        params.require(:material).permit(:material_type_id, :cost_ton, :cost_load, :cost_yard, :is_active)
      end
    end

end
