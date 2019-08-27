# frozen_string_literal: true

FactoryBot.define do
  factory :pomodoro do
    trait :with_user do
      association :user
    end

    trait :status_done do
      start_at { DateTime.now - 25.minutes }
      end_at { DateTime.now }
      status { :done }
    end

    trait :with_task do
      association :task, :with_user
    end
  end
end
