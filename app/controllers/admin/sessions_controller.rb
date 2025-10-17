class Admin::SessionsController < ApplicationController
  def new
    # Show login form
  end

  def create
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
