# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status do
    project_id 1
    flex_project_code "MyString"
    status_code "MyString"
    message "MyString"
  end
end
