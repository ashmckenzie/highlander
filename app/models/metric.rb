class Metric < ActiveRecord::Base

  include Enabler

  has_many :events
  has_many :users, through: :events

  validate :default_unit, numericality: true

  default_scope -> { enabled }

  NAMES = %w{
    github_push
    github_issue_opened
    github_issue_closed
    jenkins_green_job
    ping_pong_victory
    gift
    express_yaself
    twitter_mention
    pager_duty_ack
    bounty
    code_quality_improvement
  }

end
