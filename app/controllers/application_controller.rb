class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  layout :layout_by_resource
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_session_user




  protected

  def get_session_user
    SessionGateway.user = current_user    
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << {profile_attributes: [:name, :cpf, :rg, :telephone, :cell_phone, :email, :credits]}
  end

  def layout_by_resource
    if devise_controller?
      puts "iu"
      "devise/layouts/application"
    else
      "application"
    end
  end
end
