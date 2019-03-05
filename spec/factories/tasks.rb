# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:description) { |n| "Task #{n}" }

    trait :with_pomodoros do
      pomodoros do |task|
        [task.association(:pomodoro, strategy: :build)]
      end
    end
  end
end
