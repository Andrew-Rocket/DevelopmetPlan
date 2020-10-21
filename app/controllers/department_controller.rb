class DepartmentController < ApplicationController
  before_action :authenticate_user!, current_user.admin?


  def create
    @department = Department.new(dep_params)

    if (@department.save)
      redirect_to @post
    else
      render 'new'
    end
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if(@user.update(user_params))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show

  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
