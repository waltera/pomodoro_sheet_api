# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :pomodoros

  validates :description, presence: true
end
