class AdminController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def add_user
    @user = User.new
    authorize current_user
  end

  def delete_user
    user = User.find(params[:id])
    authorize current_user
    user.destroy
    redirect_to admin_path, :notice => "User deleted."
  end

  def view_user
    @user = User.find(params[:id])
    authorize current_user
  end

  def index

  end

  def view_all
    @users = Users.all
    authorize current_user
  end