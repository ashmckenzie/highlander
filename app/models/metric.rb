class Metric < ActiveRecord::Base

  has_many :events
  has_many :users, through: :events

  validate :default_unit, numericality: true

  NAMES = %w{
    github_push
    github_issue_opened
    github_issue_closed
    jenkins_green_job
    ming_pong_loss
    ming_pong_victory
    gift
    express_yaself
    twitter_mention
    pager_duty_ack
  }

end
