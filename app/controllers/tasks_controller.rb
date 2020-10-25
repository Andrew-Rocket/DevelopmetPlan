class TasksController < ApplicationController


  before_action :authorize_record
  before_action :find_task, only: [ :edit, :update, :destroy]

  def new
    @flow_step = FlowStep.new
  end

  def create
    @flow_step = FlowStep.find(params[:flow_step_id])

    if @flow_step.tasks.create(task_params);
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

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def authorize_record
    authorize Task
  end

  def find_task
    @task = Task.find(params[:id])
  end


end
