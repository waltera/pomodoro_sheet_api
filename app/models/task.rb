# frozen_string_literal: true

class Task < ApplicationRecord
  include StatusConcern

  has_many :pomodoros, dependent: :destroy

  validates :description, presence: true

  def pomodoros_done
    pomodoros.done
  end
end
