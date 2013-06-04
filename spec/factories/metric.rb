FactoryGirl.define do

  factory :metric do
    default_unit 1

    factory :github_push do
      name          'github_push'
      description   'GitHub push'
    end

    factory :jenkins_green_job do
      name          'jenkins_green_job'
      description   'Jenkins green job'
    end

    factory :ming_pong_victory do
      name          'ming_pong_victory'
      description   'Ming Pong victory'
      default_unit  2
    end

    factory :express_yaself do
      name          'express_yaself'
      description   'Expressed Yaself'
    end

    factory :twitter_mention do
      name          'twitter_mention'
      description   'Twitter mention'
      default_unit  10
    end

    factory :github_issue_opened do
      name          'github_issue_opened'
      description   'Opened GitHub issue'
      default_unit  5
    end

    factory :github_issue_closed do
      name          'github_issue_closed'
      description   'Closed GitHub issue'
      default_unit  5
    end

    factory :pager_duty_ack do
      name          'pager_duty_ack'
      description   'PagerDuty ack'
    end

    factory :code_climate_improvement do
      name          'code_climate_improvement'
      description   'Code Climate Improvement'
      default_unit  10
    end

  end

end
