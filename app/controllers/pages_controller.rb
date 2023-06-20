class PagesController < ApplicationController
  before_action :redirect_to_dashboard, only: :home

  def home
  end
  
  private
  
    def redirect_to_dashboard 
      if current_user 
        redirect_to dashboard_path  
      end 
    end
end
