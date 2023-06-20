class ApplicationController < ActionController::Base
  require 'faker'

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  helper_method :current_vendor, :current_vendor_name
  def current_vendor
    current_user && current_user.vendor
  end

  def current_vendor_name
    current_user && current_user.vendor && current_user.vendor.name
  end

  def paginate_params
    {page: params[:page], per_page: 20}
  end

  def editable_redirect_to(url, args)
    if request.xhr?
      render json: {status: 'ok', message: 'ok'}
    else
      redirect_to url, args
    end
  end

  def editable_render(args)
    if request.xhr?
      render json: {status: 'error', message: flash[:error]}
    else
      redirect_to url, args
    end
  end

end
