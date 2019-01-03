# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    render json: TaskSerializer.new(Task.all).serialized_json
  end
end
