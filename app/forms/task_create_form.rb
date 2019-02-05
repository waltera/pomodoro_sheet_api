# frozen_string_literal: true

class TaskCreateForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :description, :pomodoros

  validates :description, :pomodoros, presence: true
  validates_numericality_of :pomodoros, greater_than: 0

  def perform
    return unless valid?

    task.save
    pomodoros.to_i.times { task.pomodoros.create }
  end

  def task
    @task ||= Task.new(description: description)
  end
end
