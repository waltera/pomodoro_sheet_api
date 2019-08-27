# frozen_string_literal: true

class TaskCreateForm < TaskForm
  def perform
    return unless valid?

    task.save
    pomodoros.to_i.times { task.pomodoros.create(user_id: user_id) }
  end

  def task
    @task ||= Task.new(description: description, user_id: user_id)
  end
end
