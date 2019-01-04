# frozen_string_literal: true

class TaskSerializer
  include FastJsonapi::ObjectSerializer

  attribute :description
  has_many :pomodoros
end
