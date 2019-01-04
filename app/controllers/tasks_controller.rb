# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    render json: TaskSerializer.new(Task.all, options).serialized_json
  end

  private

    def options
      @options ||= { include: [:pomodoros] }
    end
end
