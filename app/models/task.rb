# frozen_string_literal: true

class Task < ApplicationRecord
  include StatusConcern

  has_many :pomodoros

  validates :description, presence: true
end
