class User < ActiveRecord::Base

  has_many :events,       -> { order 'events.created_at DESC' }
  has_many :metrics,      -> { order 'events.created_at DESC' }, through: :events
  has_many :achievements, -> { order 'achievements.created_at DESC' }
  has_many :badges,       -> { order 'achievements.created_at DESC' }, through: :achievements

  default_scope -> { enabled }

  scope :by_total_score,  -> { order 'total_score DESC, name ASC' }
  scope :enabled,         -> { where(enabled: true) }
  scope :point_earner,    -> { where(earns_points: true) }

  validates :name, presence: true
  validates :preferred_email,  uniqueness: true, presence: true
  validates :twitter_username, uniqueness: true

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

  def to_param
    slug
  end

  def self.with_email email
    where("'#{email}' = ANY (emails) OR preferred_email = '#{email}'").first
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
