# frozen_string_literal: true

class WorkController < ApplicationController
  def create
    form = WorkForm.new(task)
    form.perform

    render json: TaskSerializer.new(form.task).serialized_json, status: :created
  end

  private
    def task
      @task ||= Task.find(params[:task_id])
    end
end
