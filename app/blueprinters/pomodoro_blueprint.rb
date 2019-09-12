# frozen_string_literal: true

class PomodoroBlueprint < Blueprinter::Base
  identifier :id

  fields :created_at, :start_at, :end_at, :canceled_at, :first_try, :status
end
