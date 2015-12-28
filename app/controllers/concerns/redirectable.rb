module Redirectable
  def create_and_redirect_to_referer
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    respond_with resource, location: request.referer
  end
end