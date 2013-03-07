module AchievementCalculator
  class JenkinsGreenJob < AchievementCalculator::Base

    CONCERNED_WITH = 'jenkins_green_job'

    def calculate!
      if metric.name == CONCERNED_WITH && name = badges[total_event_count]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    attr_reader :event

    def badges
      {
        1    => '1_jenkins_green_job',
        100  => '100_jenkins_green_jobs',
        250  => '250_jenkins_green_jobs',
        500  => '500_jenkins_green_jobs',
        1000 => '1000_jenkins_green_jobs'
      }
    end
  end
end
