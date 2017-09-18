class UsersController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Admin status was updated"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:admin)
  end
end
