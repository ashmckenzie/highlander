FactoryGirl.define do

  factory :user do
    name            'Bob Smith'
    hooroo_email 'bob@hooroo.com'
    earns_points    true

    trait :tweeter do
      twitter_username { name.delete(' ').downcase }
    end

    factory :twitter_user, traits: [ :tweeter ]

  end
end