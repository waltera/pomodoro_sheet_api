# frozen_string_literal: true

class WorkForm
  attr_reader :task

  def initialize(task, user)
    @task = task
    @user = user
  end

  def perform
    if task.pomodoros.pending.count.positive?
      task.pomodoros.pending.first.update(status: :done)
    else
      task.pomodoros.create(user: @user, first_try: false, status: :done)
    end
  end
end
