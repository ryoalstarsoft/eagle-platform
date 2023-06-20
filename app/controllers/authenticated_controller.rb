class AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_admin!
  
  layout 'dashboard'
  
  private

    def redirect_admin!
      redirect_to admin_dashboard_path if current_user.haul_admin?
    end

end