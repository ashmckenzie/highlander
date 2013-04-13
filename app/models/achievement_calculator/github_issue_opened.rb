module AchievementCalculator

  class GithubIssueOpened < Base

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
