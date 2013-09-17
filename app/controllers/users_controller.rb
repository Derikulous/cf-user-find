class UsersController < ApplicationController
  before_action :find_user, only: %w(edit update show destroy)

  def index
    @users = User.all
    @users = User.search(params[:search])
  end

  def new
    @user = User.new
    @user.build_license
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User created"
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    if @user.update user_params
      flash[:notice] = "Updated user!"
      redirect_to users_url
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Deleted User!"
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :email, license_attributes: [:number, :state])
  end
end
