FactoryGirl.define do

  sequence :hooroo_email do |n|
    "person#{n}@hooroo.com"
  end

  factory :user do
    name 'Bob Smith'
    hooroo_email
    earns_points  true

    trait :tweeter do
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:twitter_service, 1, user: user)
      end
    end

    trait :githubber do
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:github_service, 1, user: user)
      end
    end

    trait :pager_duty_gimp do
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:pager_duty_service, 1, user: user)
      end
    end

  end
end
