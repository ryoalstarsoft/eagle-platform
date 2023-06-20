class Dashboard::MaterialsController < AuthenticatedController

  def index
    @material_types = MaterialType.all.order(:name)
    @material_types = @material_types.where('lower(name) = ?', params[:material_name].downcase) if params[:material_name] && params[:material_name] != ''
    @material_types = @material_types.paginate(paginate_params)
  end

end
