class TasksController < ApplicationController

  before_action :authorize_record
  before_action :find_task, only: [:edit, :update, :show, :destroy]

  def new
    @flow_step = FlowStep.new
  end

  def create

    @flow_step = FlowStep.find(params[:flow_step_id])

    if @flow_step.tasks.create(task_params)
      redirect_to @flow_step.plan
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update

    if @task.update(task_params)
      redirect_to @task.flow_step.plan
    else
      render 'edit'
    end
  end

  def show
    if(@state = TaskState.where(user_id: current_user.id, task_id: @task.id).first)
      @state
    else
      @state = TaskState.create(user_id: current_user.id, task_id: @task.id)
    end
  end

  def destroy
    redirect_to @task.flow_step.plan
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :level, :flow_step_id, :plan_id)
  end

  def authorize_record
    authorize Task
  end

  def find_task
    @task = Task.find(params[:id])
  end


end
