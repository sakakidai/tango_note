class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private
  def sign_in_required
    redirect_to(new_user_session_url) unless user_signed_in?
  end
end
