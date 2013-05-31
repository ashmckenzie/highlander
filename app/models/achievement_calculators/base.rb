require 'singleton'

module AchievementCalculators
  class Base

    include Singleton

    # FIXME: need to dry this up

    def register_event_calculator! calculator, position
      @event_calculators = [] unless @event_calculators

      Rails.logger.info "Registering event calculator '#{calculator}' at position #{position}"
      @event_calculators.insert(position, calculator)
    end

    def event_calculators
      @event_calculators ||= []
    end

    def register_achievement_calculator! calculator, position
      @achievement_calculators = [] unless @achievement_calculators

      Rails.logger.info "Registering achievement calculator '#{calculator}' at position #{position}"
      @achievement_calculators.insert(position, calculator)
    end

    def achievement_calculators
      @achievement_calculators ||= []
    end
  end
end
