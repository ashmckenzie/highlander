class EventObserver < ActiveRecord::Observer

  def after_create event
    log(event)
    calculate_achievements_for!(event)
    add_to_activity_feed!(event)
  end

  private

    def log(event)
      Rails.logger.info "New event: #{event.inspect}"
    end

    def achievement_calculators
      AchievementCalculators::Base.instance.event_calculators
    end

    def calculate_achievements_for! event
      achievement_calculators.each do |calculator|
        calculator.new(event).calculate!
      end
    end

    def add_to_activity_feed! event
      ActivityFeed::Submit.new(event).add!
    end
end
