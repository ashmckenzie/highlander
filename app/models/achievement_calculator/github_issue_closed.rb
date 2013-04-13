module AchievementCalculator

  class GithubIssueClosed < Base

    private

    def badges
      {
        1   => '1_github_issues_closed',
        25  => '25_github_issues_closed',
        50  => '50_github_issues_closed',
        100 => '100_github_issues_closed',
        500 => '500_github_issues_closed'
      }
    end
  end

end
