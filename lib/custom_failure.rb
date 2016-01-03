# Overwrites the devise redirection to /users/sign_in when auth fails
# and redirects always to root_path
class CustomFailure < Devise::FailureApp
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