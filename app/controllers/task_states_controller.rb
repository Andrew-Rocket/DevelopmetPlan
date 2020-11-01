# frozen_string_literal: true

class TaskStatesController < ApplicationController
  before_action :find_state, only: [:update]

  def update
    authorize @state

    if @state.update(state_params)
      redirect_to @state.task
    else
      render @state.task.flow_step.plan
    end
  end

  private

  def state_params
    params.require(:task_state).permit(:state, :task_id, :id)
  end

  def find_state
    @state = TaskState.find(params[:id])
  end
end
