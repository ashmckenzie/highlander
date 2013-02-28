class User < ActiveRecord::Base
  has_many :events, order: 'events.created_at DESC'
  has_many :metrics, through: :events, order: 'events.created_at DESC'

  has_many :achievements, order: 'achievements.created_at DESC'
  has_many :badges, through: :achievements, order: 'achievements.created_at DESC'

  def total_score
    events.sum(:value)
  end

  def events_for_metric metric
    events.joins(:metric).where("metrics.name = ?", metric.name)
  end
end
