module AchievementCalculator
  class GithubPush < AchievementCalculator::Base

    private

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
