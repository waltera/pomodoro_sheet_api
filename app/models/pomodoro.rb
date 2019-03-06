# frozen_string_literal: true

class Pomodoro < ApplicationRecord
  include StatusConcern

  belongs_to :task

  validate :fill_status_date

  scope :done, -> { where(status: :done) }
  scope :pending, -> { where(status: :pending) }

  def fill_status_date
    return unless status_changed?

    if done?
      self.end_at = DateTime.now
      self.start_at = end_at - 25.minutes
    elsif canceled?
      self.canceled_at = DateTime.now
    end
  end
end
