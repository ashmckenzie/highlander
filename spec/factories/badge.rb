FactoryGirl.define do

  factory :badge do

    factory :first_time  do
      name          'first_time'
      tag           'Experience the quickening'
      description   'First timer'
    end

    factory :one_twitter_mention do
      name          '1_twitter_mention'
      tag           'Fly fly little birdie!'
      description   'First Hooroo Twitter mention'
    end

    factory :one_github_push do
      name          '1_github_push'
      tag           'Octocat is pleased with you'
      description   'First GitHub push'
    end

  end
end