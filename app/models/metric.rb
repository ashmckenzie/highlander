class Metric < ActiveRecord::Base

  has_one :event

  validate :default_unit, numericality: true

  NAMES = %w{
    github_push
    jenkins_green_job
    ming_pong_loss
    ming_pong_victory
    gift
    express_yaself
    twitter_mention
  }

end
