# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    render_paginated(Task.all, TaskBlueprint)
  end

  def show
    render json: TaskBlueprint.render(task)
  end

  def create
    form = TaskCreateForm.new(task_params)

    if form.perform
      render_created(form.task, TaskBlueprint)
    else
      render_errors(form.errors)
    end
  end

  def update
    form = TaskUpdateForm.new(task, task_params)

    if form.perform
      render_updated(form.task, TaskBlueprint)
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
