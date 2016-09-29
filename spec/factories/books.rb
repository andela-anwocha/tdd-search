FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "name#{n}"}
    description "MyText"
  end
end
