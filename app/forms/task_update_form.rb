# frozen_string_literal: true

class TaskUpdateForm < TaskForm
  attr_reader :id

  def initialize(attrs = {})
    @id = attrs[:id]
    super
  end

  def perform
    return false unless valid?

    task.update(description: description) && update_pomodoros
  end

  def task
    @task ||= Task.find(id)
  end

  def update_pomodoros
    if pomodoros_integer > pending_count
      create_pomodoros
    else
      (pending_count - pomodoros_integer).times.all? { task.pomodoros.pending.last.destroy }
    end
  end

  def create_pomodoros
    (pomodoros_integer - pending_count).times.all? do
      task.pomodoros.create(first_try: done_count.zero?)
    end
  end

  def pending_count
    @pending_count ||= task.pomodoros.pending.count
  end

  def done_count
    @done_count ||= task.pomodoros.done.count
  end
end
