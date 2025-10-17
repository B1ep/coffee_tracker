class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Simple authentication system
  def admin_authenticated?
    session[:admin_authenticated] == true
  end

  def authenticate_admin
    return if admin_authenticated?

    redirect_to admin_login_path, alert: "You must be logged in as admin to perform this action."
  end

  helper_method :admin_authenticated?
end
