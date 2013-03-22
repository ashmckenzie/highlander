class User < ActiveRecord::Base

  extend FriendlyId

  has_many :events, -> { order 'events.created_at DESC' }
  has_many :metrics, -> { order 'events.created_at DESC' }, through: :events

  has_many :achievements, -> { order 'achievements.created_at DESC' }
  has_many :badges, -> { order 'achievements.created_at DESC' }, through: :achievements

  scope :by_total_score, -> { order 'total_score DESC, name ASC' }
  scope :enabled, -> { where(enabled: true) }
  scope :point_earner, -> { where(earns_points: true) }

  default_scope -> { where(enabled: true) }

  friendly_id :name, use: :slugged

  def self.with_email email
    where('? = ANY (emails)', email).first
  end

  def email
    preferred_email || ''
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
    Queries::MetricTotals.new(user: self)
  end

  def enable!
    update(enabled: true)
  end

  def disable!
    update(enabled: false)
  end

  def recalculate_total_score!
    update!(total_score: events.sum(:value))
  end

  def can_earn_points!
    update(earns_points: true)
  end

  def can_not_earn_points!
    update(earns_points: false)
  end

end
