# frozen_string_literal: true

class WorkForm
  attr_reader :task

  def initialize(task)
    @task = task
  end

  def perform
    if task.pomodoros.pending.count > 0
      task.pomodoros.pending.first.update(status: :done)
    else
      task.pomodoros.create(first_try: false, status: :done)
    end
  end
end
