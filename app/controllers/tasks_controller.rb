# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    render json: TaskSerializer.new(Task.all).serialized_json
  end

  def show
    render json: TaskSerializer.new(task).serialized_json
  end

  def create
    form = TaskCreateForm.new(task_params)

    if form.perform
      render_created(form.task, TaskSerializer)
    else
      render_errors(form.errors)
    end
  end

  def update
    form = TaskUpdateForm.new(task, task_params)

    if form.perform
      render json: TaskSerializer.new(form.task).serialized_json
    else
      render_errors(form.errors)
    end
  end

  def destroy
    task.destroy
    render status: :ok
  end

  private

    def task
      @task ||= Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :pomodoros)
    end
end
