# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:description) { |n| "Task #{n}" }

    trait :with_user do
      association :user
    end

    trait :with_pomodoros do
      pomodoros do |task|
        [task.association(:pomodoro, :with_user, strategy: :build)]
      end
    end
  end
end
