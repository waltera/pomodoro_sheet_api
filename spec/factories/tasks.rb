# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:description) { |n| "Task #{n}" }
  end
end
