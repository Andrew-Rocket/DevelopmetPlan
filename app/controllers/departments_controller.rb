# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_action :authorize_record, except: [:destroy]
  before_action :find_dep, only: %i[show edit update destroy]

  def show
  end

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
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
  end

  def update
    if @department.update(dep_params)
      redirect_to @department
    else
      render 'edit'
    end
  end

  def destroy
    authorize @department
    @department.destroy
    redirect_to departments_path
  end

  private

  def dep_params
    params.require(:department).permit(:title, :cover_img)
  end

  def authorize_record
    authorize Department
  end

  def find_dep
    @department = Department.find(params[:id])
  end
end
