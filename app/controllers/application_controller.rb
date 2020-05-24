class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    root_path
  end

  private
  def sign_in_required
    redirect_to(new_user_session_url) unless user_signed_in?
  end
end
