class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_recaptcha, only: [:create] # Change this to be any actions you want to protect.

  def create
    self.resource = warden.authenticate!(auth_options)

    if resource && resource.otp_module_disabled?
      continue_sign_in(resource, resource_name)
    elsif resource && resource.otp_module_enabled?
      if params[:user][:otp_code_token].size > 0
        if resource.authenticate_otp(params[:user][:otp_code_token], drift: 60)
          continue_sign_in(resource, resource_name)
        else
          sign_out resource
          redirect_to root_url, alert: 'Bad Credentials Supplied.'
        end
      else
        sign_out resource
        redirect_to root_url, alert: 'Your account needs to supply a token.'
      end
    end
  end

  private

  def continue_sign_in(resource, resource_name)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def check_recaptcha
    return if verify_recaptcha # verify_recaptcha(action: 'login') for v3

    self.resource = resource_class.new sign_in_params
    respond_with_navigational(resource) do
      flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
      render :new
    end
  end
end
