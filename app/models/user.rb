class User < ActiveRecord::Base

  has_many :events,       -> { order 'events.created_at DESC' }
  has_many :metrics,      -> { order 'events.created_at DESC' }, through: :events
  has_many :achievements, -> { order 'achievements.created_at DESC' }
  has_many :badges,       -> { order 'achievements.created_at DESC' }, through: :achievements

  has_many :user_services, dependent: :destroy

  default_scope           -> { enabled }
  scope :enabled,         -> { where(enabled: true) }
  scope :point_earner,    -> { where(earns_points: true) }
  scope :leaderboarder,   -> { where(leaderboarder: true) }

  validates :name,              presence: true
  validates :hooroo_email,      uniqueness: true, presence: true
  validates :avatar_email,      uniqueness: true, allow_blank: true

  class << self
    alias_method :original_find, :find
  end

  module QueryMethods
    module ClassMethods

      def with_id_or_slug lookup
        if lookup.to_s.match(/^\d+$/)
          query = "#{table_name}.id = ?"
        else
          query = "#{table_name}.slug = ?"
        end
        where(query, lookup).first
      end
    end

    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        class << self
          alias_method :original_find, :find
          alias_method :find, :with_id_or_slug
        end
      end
    end
  end

  include QueryMethods

  def service_for service_type
    service_type = "Services::#{service_type.to_s.camelize}"
    user_services.includes(:service).where('user_services.service_type = ?', service_type).first.try(:service)
  end

  def to_param
    slug
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

  def enable!
    update(enabled: true)
  end

  def disable!
    update(enabled: false)
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
end
