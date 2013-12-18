# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    stripe_customer_token "MyString"
    project nil
  end
end
