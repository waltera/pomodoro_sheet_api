# frozen_string_literal: true

class WorkController < ApplicationController
  def create
    form = WorkForm.new(task)
    form.perform

    render_created(form.task, TaskBlueprint)
  end

  private

    def task
      @task ||= Task.find(params[:task_id])
    end
end
