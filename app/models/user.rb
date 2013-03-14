class User < ActiveRecord::Base
  has_many :events, order: 'events.created_at DESC'
  has_many :metrics, through: :events, order: 'events.created_at DESC'

  has_many :achievements, order: 'achievements.created_at DESC'
  has_many :badges, through: :achievements, order: 'achievements.created_at DESC'

  scope :by_total_score, -> { order('total_score DESC, name ASC') }

  def email
    emails.first
  end

  def email=(email)
    emails << email unless emails.include? email
  end

  def total_badges
    achievements.count
  end

  def events_for_metric metric
    events.joins(:metric).where("metrics.name = ?", metric.name)
  end

  def avatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def metric_totals
    QueryObjects::MetricTotals.new(user: self)
  end

end
