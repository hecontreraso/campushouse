class Users::SessionsController < Devise::SessionsController
  # respond_to :html, :json
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    respond_with resource, location: request.referer
  end

  def failure
    flash[:alert] = I18n.t("user.not_found_in_database")
    respond_with resource, location: request.referer
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end

  # respond_to :html, :json
  # def create
  #   resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
  #   sign_in(resource_name, resource)
  #   return render :json => {:success => true, location: after_sign_in_path_for(resource), token: form_authenticity_token}
  # end

  # def failure
  #   return render :json => {error_msg: "Login details incorrect."}, status: 422
  # end
