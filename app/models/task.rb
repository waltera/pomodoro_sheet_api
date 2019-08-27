# frozen_string_literal: true

class Task < ApplicationRecord
  include UserScopeConcern
  include StatusConcern

  has_many :pomodoros, dependent: :destroy

  validates :description, presence: true
end
