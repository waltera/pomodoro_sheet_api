# frozen_string_literal: true

class TaskForm
  include ActiveModel::Model

  attr_accessor :user_id, :description, :pomodoros

  validates :description, :pomodoros, presence: true
  validates_numericality_of :pomodoros, greater_than: 0

  def pomodoros_integer
    @pomodoros_integer ||= pomodoros.to_i
  end
end
