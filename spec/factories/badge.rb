FactoryGirl.define do

  factory :badge do

    factory :first_time do
      name          'first_time'
      tag           'Experience the quickening'
      description   'First timer'
    end

    trait :hipster do
      name          'hipster'
      tag           "You're so not mainstream"
      description   'Hipster'
    end

    factory :one_twitter_mention do
      name          '1_twitter_mention'
      tag           'Fly fly little birdie!'
      description   'First Hooroo Twitter mention'
    end

    factory :one_github_push do
      name          '1_github_push'
      tag           'Octocat is pleased with you'
      description   'First Github push'
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

    factory :one_ping_pong_victory do
      name          '1_ping_pong_victory'
      tag           'One small step forward'
      description   'First Ping Pong victory'
    end

    factory :ten_ping_pong_victories do
      name          '10_ping_pong_victories'
      tag           'Paddle master'
      description   '10 Ping Pong victories'
    end

    factory :one_github_issue_opened do
      name          '1_github_issue_opened'
      tag           'Picky bug-ger'
      description   'First Github issue opened'
    end

    factory :twenty_five_github_issues_opened do
      name          '25_github_issues_opened'
      tag           'Master bug spotter!'
      description   '25 Github issues opened'
    end

    factory :one_github_issue_closed do
      name          '1_github_issue_closed'
      tag           'Bug squasher'
      description   'First Github issue closed'
    end

    factory :twenty_five_github_issues_closed do
      name          '25_github_issues_closed'
      tag           '25 issues resolved... not too shabby'
      description   '25 Github issues closed'
    end

    factory :one_pager_duty_ack do
      name          '1_pager_duty_ack'
      tag           "Hope I didn't interrupt dinner?"
      description   'First PagerDuty ack'
    end

  end
end
