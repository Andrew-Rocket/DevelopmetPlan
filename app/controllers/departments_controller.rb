class DepartmentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @department = Department.find(params[:id])
  end

  def index
    @departments = Department.all
    'index'
  end

  def new
    @department = Department.new
    'new'
  end

  def create
    @department = Department.new(dep_params)

    if @department.save
      redirect_to @department
    else
      render 'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])

    if @department.update(dep_params)
      redirect_to @department
    else
      render 'edit'
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path
  end

  private def dep_params
    params.require(:department).permit(:title)
  end
end
