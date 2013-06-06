module AchievementCalculators
  module Calculators
    class GithubIssueOpened < Event

      event_calculator!

      private

      def badges
        {
          1   => '1_github_issue_opened',
          25  => '25_github_issues_opened',
          50  => '50_github_issues_opened',
          100 => '100_github_issues_opened',
          500 => '500_github_issues_opened'
        }
      end
    end

  end

end
