FactoryGirl.define do
  factory :project do
    name 'A test project'
    due_date Date.today + 3.day
    flex_project_id '13.016.802'
    factory :project_with_address do
      ignore do
        address_count 1
      end
      after(:create) do |project, evaluator|
        FactoryGirl.create_list(:address,evaluator.address_count, project: project)
      end
    end
  end
end
