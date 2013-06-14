class Metric < ActiveRecord::Base

  include Enabler

  has_many :events
  has_many :users, through: :events

  validate :default_unit, numericality: true

  default_scope -> { enabled }

  NAMES = %w{
    twitter_mention
  }

end
