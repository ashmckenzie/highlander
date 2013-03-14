class User < ActiveRecord::Base

  has_many :events, order: 'events.created_at DESC'
  has_many :metrics, through: :events, order: 'events.created_at DESC'

  has_many :achievements, order: 'achievements.created_at DESC'
  has_many :badges, through: :achievements, order: 'achievements.created_at DESC'

  scope :by_total_score, -> { order('total_score DESC, name ASC') }

  def self.with_email email
    where('? = ANY (emails)', email).first
  end

  def email
    preferred_email
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

  def avatar_url size=80
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def metric_totals
    QueryObjects::MetricTotals.new(user: self)
  end

end
