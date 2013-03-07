module AchievementCalculator
  class GitHubCommit < AchievementCalculator::Base

    CONCERNED_WITH = 'github_commit'

    def calculate!
      if metric.name == CONCERNED_WITH && name = badges[total_event_count]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    attr_reader :event

    def badges
      {
        1   => '1_github_commit',
        100 => '100_github_commits',
        500 => '500_github_commits'
      }
    end
  end
end
