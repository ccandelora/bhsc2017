class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.order(:email)
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize current_user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def edit
    @user = User.find(params[:id])
    authorize current_user
  end

  private

  def secure_params
    params.require(:user).permit(:name, :email, :role)
  end

end
