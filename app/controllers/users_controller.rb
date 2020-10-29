class UsersController < ApplicationController
  before_action :authorize_current_user, :get_current_user, only: [:edit, :update]

  def index
    authorize User

    @users = User.all
  end

  def show
    authorize User

    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :department_id, :level, :email, :avatar)
  end

  def get_current_user
    @user = User.find(params[:id])
  end


  def authorize_current_user
    @user = User.find(params[:id])
  end
end
