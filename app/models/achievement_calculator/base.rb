module AchievementCalculator
  class Base

    def initialize event
      @event = event
    end

    def calculate!
      if metric.name == concerned_with && name = badges[total_event_count]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    attr_reader :event

    def concerned_with
      self.class.to_s.demodulize.underscore
    end

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
      Rails.logger.info "Adding '#{badge.name}' badge to '#{user.email}'"
      user.achievements << Achievement.create(badge: badge)
    end
  end
end
