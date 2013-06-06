FactoryGirl.define do

  sequence :twitter_username do |n|
    "tweeter#{n}"
  end

  sequence :github_username do |n|
    "github_user#{n}"
  end

  sequence :email do |n|
    "person#{n}@hooroo.com"
  end

  factory :twitter_service, class: 'Services::Twitter' do
    username { generate(:twitter_username) }
  end

  factory :github_service, class: 'Services::Github' do
    username { generate(:github_username) }
    emails { [ generate(:email) ] }
  end

  factory :pager_duty_service, class: 'Services::PagerDuty' do
    email
  end
end
