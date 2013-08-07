class StatsController < ApplicationController

  def index
    @stats = Rails.cache.fetch('stats', expires_in: 30.minutes) do
      OpenStruct.new(
        events_by_created_at: Event.group_by_day(:created_at).count,
        events_by_metric: Event.joins(:metric).group('metrics.description').count.sort { |x, y| y[1] <=> x[1] },
        github_pushes_by_created_at: Event.joins(:metric).where("metrics.name = 'github_push'").group_by_day("events.created_at").count,
        jenkins_green_jobs_by_created_at: Event.joins(:metric).where("metrics.name = 'jenkins_green_job'").group_by_day("events.created_at").count,
        achievements_by_created_at: Achievement.unscoped.group_by_day(:created_at).count,
        achievements_by_badge: Achievement.unscoped.joins(:badge).group('badges.description').count.sort { |x, y| y[1] <=> x[1] },
      )
    end
  end
end
