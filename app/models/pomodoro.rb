# frozen_string_literal: true

class Pomodoro < ApplicationRecord
  include StatusConcern

  belongs_to :task

  validate :validate_end_at

  def validate_end_at
    return if end_at.present?
    return if start_at.blank?

    errors.add(:end_at, :blank)
  end
end
