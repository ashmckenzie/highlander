module Queries

  class AchievementsAndBadgeTakeupForUser

    def initialize(user)
      @user = user
    end

    def query
      user.achievements
        .joins(:badge)
        .select("
          achievements.*,
          badges.*,
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
