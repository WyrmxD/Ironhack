# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    author "John Doe"
    body "This is a factorygirl comment"
    association :movie
  end
end
