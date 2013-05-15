FactoryGirl.define do

  sequence :twitter_username do |n|
    "tweeter#{n}"
  end

  factory :twitter_service, class: 'Services::Twitter' do
    username { generate(:twitter_username) }
  end
end
