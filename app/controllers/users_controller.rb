class UsersController < ApplicationController


  def index
    @users = User.all

    authorize @user
  end

  def show
    @user = User.find(params[:id])

    authorize @user
  end

  def edit
    @user = current_user

    authorize @user
  end

  def update
    @user = current_user

    if(@user.update(user_params))
      redirect_to @user
    else
      render 'edit'
    end

    authorize @user
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
