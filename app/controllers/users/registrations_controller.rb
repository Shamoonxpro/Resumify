class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_recaptcha, only: [:create] # Change this to be any actions you want to protect.
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  private
  def check_recaptcha
    return if verify_recaptcha # verify_recaptcha(action: 'signup') for v3
    self.resource = resource_class.new sign_up_params
    resource.validate # Look for any other validation errors besides reCAPTCHA
    set_minimum_password_length
    respond_with_navigational(resource) do
      flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
      render :new
    end
  end
end