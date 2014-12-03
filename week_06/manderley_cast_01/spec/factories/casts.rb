# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cast do
    role "MyString"
    association :person
    association :movie
  end
end
