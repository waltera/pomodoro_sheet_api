# frozen_string_literal: true

class TaskBlueprint < Blueprinter::Base
  identifier :id

  fields :description

  association :pomodoros, blueprint: PomodoroBlueprint
end
