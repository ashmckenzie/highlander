module AchievementCalculator
  class Base

    CONCERNED_WITH = ''

    def initialize event
      @event = event
    end

    def calculate!
      if metric.name == CONCERNED_WITH && name = badges[total_event_count]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    attr_reader :event

    def badges
      raise NotImplementedError
    end

    def badge_for name
      Badge.where(name: name).first
    end

    def user
      event.user
    end

    def metric
      event.metric
    end

    def total_event_count
      user.events_for_metric(metric).count
    end

    def add_achievement_for_badge badge
      user.achievements << Achievement.create(badge: badge)
    end
  end
end
