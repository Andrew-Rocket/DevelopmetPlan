# frozen_string_literal: true

class FlowStepsController < ApplicationController
  before_action :authorize_record
  before_action :find_flow_step, only: %i[edit update destroy]

  def create
    @plan = Plan.find(params[:plan_id])

    if @plan.flow_steps.create(flow_step_params)
      redirect_to @plan
    else
      render @plan
    end
  end

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
