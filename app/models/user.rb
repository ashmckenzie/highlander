class User < ActiveRecord::Base

  include Enabler
  include Slugger

  has_many :events,       -> { order 'events.created_at DESC' }
  has_many :metrics,      -> { order 'events.created_at DESC' }, through: :events
  has_many :achievements, -> { order 'achievements.created_at DESC' }
  has_many :badges,       -> { order 'achievements.created_at DESC' }, through: :achievements

  has_many :user_services, dependent: :destroy

  has_many :bounties_created, class_name: 'Bounty', foreign_key: 'created_by_id'
  has_many :bounties_claimed, class_name: 'Bounty', foreign_key: 'claimed_by_id'

  default_scope           -> { enabled }

  scope :point_earner,    -> { where(earns_points: true) }
  scope :leaderboarder,   -> { where(leaderboarder: true) }

  validates :name,              presence: true
  validates :hooroo_email,      uniqueness: true, presence: true
  validates :avatar_email,      uniqueness: true, allow_blank: true

  before_save :set_role_to_user

  ROLES = %w[admin user]

  def service_for service_type
    service_type = "Services::#{service_type.to_s.camelize}"
    user_services.includes(:service).where('user_services.service_type = ?', service_type).first.try(:service)
  end

  # TODO: this 1.weeks.ago logic is replicated in the RunningLeaderboard query. Simplify.
  def running_score
    events.where('created_at > ?', 1.weeks.ago.to_s(:db)).sum(:value)
  end

  def total_score
    @total_score ||= events.sum(:value)
  end

  def badge_count
    @total_badges ||= achievements.count
  end

  def primary_email
    hooroo_email
  end

  def self.with_email email
    where("'#{email}' = ANY (emails) OR hooroo_email = '#{email}'").first
  end

  def events_for_metric metric
    events.joins(:metric).where("metrics.name = ?", metric.name)
  end

  def metric_totals
    Queries::UserMetricTotals.new(user: self)
  end

  def can_earn_points!
    update(earns_points: true)
  end

  def can_not_earn_points!
    update(earns_points: false)
  end

  def left_hooroo!
    update(leaderboarder: false, earns_points: false)
  end

  private

  def set_role_to_user
    self.role = 'user'
  end
end
