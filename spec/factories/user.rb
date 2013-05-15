FactoryGirl.define do

  sequence :hooroo_email do |n|
    "person#{n}@hooroo.com"
  end

  sequence :github_username do |n|
    "github_user#{n}"
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
      github_username
    end

    factory :github_user,  traits: [ :githubber ]

  end
end
