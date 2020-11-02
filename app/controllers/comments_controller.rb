# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authorize_record

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    @comment.user_id= current_user.id

    flash[:notice] = 'Something went wrong' unless @comment.save

    redirect_back(fallback_location: root_path)
  end


  private

  def authorize_record
    authorize Comment
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

end

