FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@prov.com" }
    password { '12341234' }
    password_confirmation { '12341234' }

    after(:create) do |user|
      Doorkeeper::AccessToken.create(resource_owner_id: user.id)
    end
  end
end
