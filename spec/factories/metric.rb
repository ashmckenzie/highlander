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

    factory :ming_pong_loss do
      name          'ming_pong_loss'
      description   'Ming Pong loss'
      default_unit  0
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

  end

end