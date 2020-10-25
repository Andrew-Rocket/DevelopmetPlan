class FlowStepsController < ApplicationController
  before_action :authorize_record
  before_action :find_flow_step, only: [ :edit, :update, :destroy]

  def create
    # @flow_step = FlowStep.new(flow_step_params)
    @plan = Plan.find(params[:plan_id])

    if @plan.flow_steps.create(flow_step_params);
      #redirect_to @plan
    else
      #render @plan
    end
  end

  # def update
  #   #  @department = Department.find(params[:id])
  #
  #   if @department.update(dep_params)
  #     redirect_to @department
  #   else
  #     render 'edit'
  #   end
  # end
  #
  # def destroy
  #   #   @department = Department.find(params[:id])
  #   @department.destroy
  #   redirect_to departments_path
  # end

  private

  def flow_step_params
    params.require(:flow_step).permit(:title)
  end

  def authorize_record
    authorize FlowStep
  end

  def find_flow_step
    @flow_step = FlowStep.find(params[:id])
  end

end
