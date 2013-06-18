module Queries

  class AchievementsAndBadgeTakeupForUser

    def initialize(user)
      @user = user
    end

    def query

      # NOTE: The order of badges.* and achievements.* is critical here
      #
      user.achievements
        .joins(:badge)
        .select("
          badges.*,
          achievements.*,
          badges.tag as badge_tag,
          achievements.tag as achievement_tag,
          (
            SELECT
              COUNT(user_id)
            FROM
              achievements
            JOIN users ON users.id = achievements.user_id
            WHERE
              users.enabled = 't' AND
              users.leaderboarder = 't' AND
              badge_id = badges.id
            ) AS badge_takeup_count
        ")
        .order('achievements.created_at DESC')
    end

    private

    attr_reader :user
  end
end
