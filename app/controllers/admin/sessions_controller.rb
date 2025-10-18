class Admin::SessionsController < ApplicationController
  # HTTP Basic Authentication - First layer of security
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USERNAME', 'blep'),
                                password: ENV.fetch('ADMIN_HTTP_PASSWORD', 'brooklyn-celtics-espresso')

  def new
    # Show login form
  end

  def create
    # Session password - Second layer of security
    admin_password = ENV['ADMIN_PASSWORD'] || 'changeme123'

    if params[:password] == admin_password
      session[:admin_authenticated] = true
      redirect_to root_path, notice: "Successfully logged in as admin!"
    else
      flash.now[:alert] = "Invalid password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin_authenticated] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end
end
