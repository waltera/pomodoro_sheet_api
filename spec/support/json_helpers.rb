# frozen_string_literal: true

module JsonHelpers
  def parsed_body
    @parsed_body ||= JSON.parse(response.body) rescue response.body
  end

  def task_json(task)
    hash = {
      'id' => task.id,
      'description' => task.description,
      'pomodoros' => task.pomodoros.map { |pomodoro| pomodoro_json(pomodoro) }
    }
  end

  def pomodoro_json(pomodoro)
    {
      'id' => pomodoro.id,
      'canceled_at' => pomodoro.canceled_at.try(:to_s),
      'created_at' => pomodoro.created_at.try(:to_s),
      'end_at' => pomodoro.end_at.try(:to_s),
      'start_at' => pomodoro.start_at.try(:to_s),
      'first_try' => pomodoro.first_try,
      'status' => pomodoro.status
    }
  end
end
