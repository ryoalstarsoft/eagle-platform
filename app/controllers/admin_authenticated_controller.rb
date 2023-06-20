class AdminAuthenticatedController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  
  layout 'admin'
  
  private

    def authenticate_admin!
    return if current_user.haul_admin?
    
    sign_out @current_user
    redirect_to root_path, error: 'You must be a HaulHQ Admin to enter this area!'
  end

end