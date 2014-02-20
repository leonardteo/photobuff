class ProfilesController < ApplicationController

  before_action :require_login

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Updated your profile!"
      redirect_to edit_profile_path
    else
      render :action => 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end
end
