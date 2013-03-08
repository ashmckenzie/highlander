module AchievementCalculator
  class GitHubPush < AchievementCalculator::Base

    CONCERNED_WITH = 'github_push'

    def calculate!
      if metric.name == CONCERNED_WITH && name = badges[total_event_count]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    attr_reader :event

    def badges
      {
        1     => '1_github_push',
        100   => '100_github_pushes',
        250   => '250_github_pushes',
        500   => '500_github_pushes',
        1000  => '1000_github_pushes'
      }
    end
  end
end
