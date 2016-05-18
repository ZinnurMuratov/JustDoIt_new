class SubtasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task
  before_action :set_subtask, except: [:create]

  def create
    @subtask = @task.subtasks.create(subtask_params)
    redirect_to @task
  end

  def destroy
    if @subtask.destroy
      flash[:success] = "Todo List item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @task
  end

  def complete
    @subtask.update_attribute(:completed_at, Time.now)
    @subtask.update_attribute(:status, true)
    redirect_to @task, notice: "Todo item completed"
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_subtask
    @subtask = @task.subtasks.find(params[:id])
  end

  def subtask_params
    params[:subtask].permit(:title,:importance,:urgency,:due_time,:status)
  end
end
