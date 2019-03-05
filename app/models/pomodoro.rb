# frozen_string_literal: true

class Pomodoro < ApplicationRecord
  include StatusConcern

  belongs_to :task

  validate :validate_start_at, :validate_end_at, if: :done?
  validate :validate_canceled_at, if: :canceled?

  scope :done, -> { where(status: :done) }
  scope :pending, -> { where(status: :pending) }

  def validate_start_at
    return if start_at.present?

    errors.add(:start_at, :blank)
  end

  def validate_end_at
    return if end_at.present?

    errors.add(:end_at, :blank)
  end

  def validate_canceled_at
    return if canceled_at.present?

    errors.add(:canceled_at, :blank)
  end
end
