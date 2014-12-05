FactoryGirl.define do
  factory :vote do
    association :movie
    rank :not_voted

    trait :liked do
      rank :liked
    end

    trait :disliked do
      rank :disliked
    end
  end
end
