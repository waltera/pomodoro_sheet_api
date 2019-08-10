# frozen_string_literal: true

class Task < ApplicationRecord
  include StatusConcern

  has_many :pomodoros, dependent: :destroy

  validates :description, presence: true
end
