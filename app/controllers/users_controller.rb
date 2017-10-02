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

  def create
    authorize current_user
    if params['user']
      u = params['user']
      user = User.new
      user.name = u['name']
      user.email = u['email']
      user.role = u['role']
      user.password = u['password']
      user.save
      redirect_to users_path, :notice => "User created."
    else
      redirect_to users_path, :alert => "Unable to create user."
    end
  end

  def new
    @user = User.new
    authorize current_user
  end

  private

  def secure_params
    params.require(:user).permit(:name, :email, :role, :password)
  end

end
