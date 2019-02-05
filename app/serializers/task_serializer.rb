# frozen_string_literal: true

class TaskSerializer
  include FastJsonapi::ObjectSerializer

  def initialize(object, options = {})
    options.merge!(include: [:pomodoros])
    super
  end

  attribute :description
  has_many :pomodoros
end
