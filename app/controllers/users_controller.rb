class UsersController < ApplicationController
  before_action :find_user, only: %w(show)

  def index
    @users = User.all
  end

  def new
    @user = User.new
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

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :email, license_attributes: [:number, :state])
  end
end

