class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  layout :layout_by_resource
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!
  before_filter :get_session_user



  protected
  
  def after_sign_in_path_for(resource)
   # After you enter login info and click submit, I want you to be sent to the registrations#show page
   profile_path(resource.profile_id)
  end

  def get_session_user
    SessionGateway.user = current_user    
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << {profile_attributes: [:name, :cpf, :rg, :telephone, :cell_phone, :email, :credits]}
  end

  def layout_by_resource
    if devise_controller?
      "devise/layouts/application"
    else
      "application"
    end
  end
end
