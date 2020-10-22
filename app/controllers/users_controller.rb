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

  def edit

  end

  def update

    if (@user.update(user_params))
      redirect_to @user
    else
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def get_current_user
    @user = Department.find(params[:id])
  end


  def authorize_current_user
    @user = Department.find(params[:id])
  end
end
