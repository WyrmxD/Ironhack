# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    year 1985
    duration 1
    synopsis "Once upon a time..."
  end
end
