# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    render json: TaskSerializer.new(Task.all).serialized_json
  end

  def create
    form = TaskCreateForm.new(task_params)

    if form.perform
      render_created(form.task, TaskSerializer)
    else
      render_errors(form.errors)
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :pomodoros)
    end
end
