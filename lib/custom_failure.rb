# This class overrides the redirection to /users/sign_in when user is not
# logged in. Instead, redirects to root path and shows a flash message
class CustomFailure < Devise::FailureApp
  def redirect_url
     new_user_session_url(:subdomain => 'secure')
  end

  # You need to override respond to eliminate recall
  def redirect
    store_location!
    if is_flashing_format?
      if flash[:timedout] && flash[:alert]
        flash.keep(:timedout)
        flash.keep(:alert)
      else
        flash[:alert] = i18n_message
      end
    end
    redirect_to root_path
  end
end