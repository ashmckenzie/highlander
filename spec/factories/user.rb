FactoryGirl.define do

  sequence :hooroo_email do |n|
    "person#{n}@hooroo.com"
  end

  sequence :twitter_username do |n|
    "tweeter#{n}"
  end

  factory :user do
    name 'Bob Smith'
    hooroo_email
    earns_points  true

    trait :tweeter do
      twitter_username
    end

    factory :twitter_user, traits: [ :tweeter ]

  end
end