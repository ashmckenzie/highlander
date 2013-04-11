FactoryGirl.define do

  factory :badge do

    factory :first_time do
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

    factory :one_jenkins_green_job do
      name          '1_jenkins_green_job'
      tag           'Well done, sir'
      description   'First Jenkins green job'
    end

    factory :one_hundred_jenkins_green_jobs do
      name          '100_jenkins_green_jobs'
      tag           'Green goblin centurion'
      description   '100 Jenkins green jobs'
    end

    factory :one_ming_pong_victory do
      name          '1_ming_pong_victory'
      tag           'One small step forward'
      description   'First Ming Pong victory'
    end

    factory :ten_ming_pong_victories do
      name          '10_ming_pong_victories'
      tag           'Paddle master'
      description   '10 Ming Pong victories'
    end

  end
end