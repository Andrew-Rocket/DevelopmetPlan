class PlansController < ApplicationController
  before_action :authorize_record
  before_action :find_plan, only: [:show, :edit, :update, :destroy]

  def show

  end

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @department = Department.find(params[:department_id])

    if (@plan = @department.plans.create(plan_params))
      redirect_to @department
    else
      render 'new'
    end
  end

  def edit

  end

  def update


    if @plan.update(plan_params)
      redirect_to @plan
    else
      render 'edit'
    end
  end

  def destroy
    @plan.destroy
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :department_id)
  end

  def authorize_record
    authorize Plan
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end

end
