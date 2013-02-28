class User < ActiveRecord::Base
  has_many :events
  has_many :metrics, through: :events, order: 'events.created_at DESC'

  def total_score
  end
end
