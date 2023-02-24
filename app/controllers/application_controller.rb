class ApplicationController < ActionController::Base
  
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  

    
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email,:cnic,:phone,:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email,:cnic,:phone])
  end
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
     users_show_path(resource)
    else
      super
    end
  end
  def after_update_path_for(resource)
    users_show_path(resource)
  end
end