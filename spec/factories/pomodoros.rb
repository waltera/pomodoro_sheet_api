# frozen_string_literal: true

FactoryBot.define do
  factory :pomodoro do
    trait :status_done do
      start_at { DateTime.now - 25.minutes }
      end_at { DateTime.now }
      status { :done }
    end
  end
end
