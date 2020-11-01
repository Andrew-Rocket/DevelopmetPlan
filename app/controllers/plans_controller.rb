# frozen_string_literal: true
class PlansController < ApplicationController
  before_action :authorize_record
  before_action :find_plan, only: %i[show edit update destroy export_as_pdf]

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

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to @plan
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to @plan.department
    @plan.destroy
  end

  def export_as_pdf
    ExportPlanJob.perform_later(current_user.email, @plan)
    redirect_to @plan
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
