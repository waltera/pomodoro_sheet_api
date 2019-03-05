# frozen_string_literal: true

class TaskForm
  include ActiveModel::Validations

  attr_reader :description, :pomodoros

  validates :description, :pomodoros, presence: true
  validates_numericality_of :pomodoros, greater_than: 0

  def initialize(attrs = {})
    @description = attrs[:description]
    @pomodoros   = attrs[:pomodoros]
  end

  def pomodoros_integer
    @pomodoros_integer ||= pomodoros.to_i
  end
end
