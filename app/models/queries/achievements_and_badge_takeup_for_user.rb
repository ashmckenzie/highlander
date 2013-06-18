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
          (SELECT COUNT(user_id) from achievements WHERE badge_id = badges.id) AS badge_takeup_count,
          (SELECT ROUND(100.0 * (
            (SELECT 1.0 * COUNT(user_id) FROM achievements WHERE badge_id = badges.id) /
            (" + User.select('1.0 * COUNT(id)').point_earner.to_sql +  ")
          ), 0))::integer AS badge_takeup_percentage
        ")
        .order('achievements.created_at DESC')
    end

    private

    attr_reader :user
  end
end
