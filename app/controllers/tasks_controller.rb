class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.all
  end

  def new
    @task = Task.new
  end

  def show
    @subtasks = @task.subtasks.order(" status ASC,importance DESC, urgency DESC")
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Todo list was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @task = Task.new(task_params)


    if @task.save
      respond_to do |format|
        format.js
      end
    else
      render json: { success: false, errors: [@task.errors.messages] }, status: 400
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:user_id,:title, :description)
  end

end
