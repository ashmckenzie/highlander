module Queries
  class Stats

    def initialize(user: nil, events: true, achievements: true)
      @user = user
      @events = events
      @achievements = achievements

      @conditions = {}
      @conditions[:user] = user if user
    end

    def each(&block)
      query.each(&block)
    end

    def query point_in_time=Time.at(0)
      event_results = {}
      achievement_results = {}

      if events
        recent_events = "events.created_at > '#{point_in_time}'"

        event_results = {
          events_by_metric: Event.joins(:metric, :user).where(conditions).group('metrics.description').count.sort { |x, y| y[1] <=> x[1] },
          events: {
            all: Event.joins(:user).where(conditions).where(recent_events).group_by_day('events.created_at').count.sort,
            github: Event.joins(:metric, :user).where(conditions).where(recent_events).where("metrics.name = 'github_push'").group_by_day("events.created_at").count.sort,
            jenkins: Event.joins(:metric, :user).where(conditions).where(recent_events).where("metrics.name = 'jenkins_green_job'").group_by_day("events.created_at").count.sort
          }
        }
      end

      if achievements
        recent_achievements = "achievements.created_at > '#{point_in_time}'"

        achievement_results = {
          achievements_by_created_at: Achievement.unscoped.joins(:user).where(conditions).where(recent_achievements).group_by_day('achievements.created_at').count.sort,
          achievements_by_badge: Achievement.unscoped.joins(:badge, :user).where(conditions).where(recent_achievements).group('badges.description').count.sort { |x, y| y[1] <=> x[1] }
        }
      end

      OpenStruct.new(event_results.merge(achievement_results))
    end

    private

    attr_reader :user, :conditions, :events, :achievements

  end
end
