# frozen_string_literal: true

class TaskCreateForm < TaskForm
  def perform
    return unless valid?

    task.save
    pomodoros.to_i.times { task.pomodoros.create }
  end

  def task
    @task ||= Task.new(description: description)
  end
end
