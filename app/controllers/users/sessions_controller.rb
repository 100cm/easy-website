class Users::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]
before_action :ensure_login ,except: [:destroy]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

def ensure_login
  if company_signed_in?

    redirect_to "/"

  end


end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
