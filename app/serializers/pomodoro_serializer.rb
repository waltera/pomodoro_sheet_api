# frozen_string_literal: true

class PomodoroSerializer
  include FastJsonapi::ObjectSerializer

  attributes :created_at, :start_at, :end_at, :canceled_at, :status
end
