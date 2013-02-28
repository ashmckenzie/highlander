class EventObserver < ActiveRecord::Observer
  def after_create event
    [
      AchievementCalculators::GitHubCommit
    ].each do |calculator|
      calculator.new(event).calculate!
    end
  end
end
