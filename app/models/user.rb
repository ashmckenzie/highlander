class User < ActiveRecord::Base
  has_many :events, order: 'events.created_at DESC'
  has_many :metrics, through: :events, order: 'events.created_at DESC'

  has_many :achievements, order: 'achievements.created_at DESC'
  has_many :badges, through: :achievements, order: 'achievements.created_at DESC'

  scope :by_total_score, -> { order('total_score DESC') }

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

  def metrics_with_values
    Metric.select('metrics.id, metrics.description, coalesce(sum(events.value), 0) as event_total').joins('left join events on events.metric_id = metrics.id').where('events.user_id = ? or events.user_id is null', id).group('metrics.id, metrics.description')
    # select metrics.description, coalesce(sum(events.value), 0) from metrics left join events on events.metric_id = metrics.id where (events.user_id = 2 or events.user_id is null) group by metrics.description order by metrics.description;
  end
end
