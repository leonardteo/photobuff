class AuthController < ApplicationController

  # GET /login
  def login
  end

  # POST /login
  def dologin
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.first_name}!"
      redirect_to root_path
    else
      flash[:error] = "No user found with that email/password."
      render :login
    end
  end

  # GET /logout
  def logout
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end

end
