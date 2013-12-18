FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email-#{SecureRandom.base64}-#{n}@example.local" }
    password 'password'
    flex_id 17684
    factory :user_with_project do
      ignore do
        project_count 1
      end

      after(:create) do |user,evaluator|
        FactoryGirl.create_list(:project_with_address,evaluator.project_count, user: user)
      end
    end
  end
end
