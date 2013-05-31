module AchievementCalculators
  module Calculators
    class Event

      def initialize event
        @event = event
      end

      def calculate!
        if metric.name == concerned_with && name = badges[total_event_count]
          add_achievement_for_badge badge_for(name)
        end
      end

      def self.event_calculator!(position: -1)
        AchievementCalculators::Base.instance.register_event_calculator!(self, position)
      end

      protected

      def user
        event.user
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

      def metric
        event.metric
      end

      def total_event_count
        user.events_for_metric(metric).count
      end

      def add_achievement_for_badge badge, tag=''
        ::Achievement.create(badge: badge, user: user, tag: tag)
      end
    end
  end
end
