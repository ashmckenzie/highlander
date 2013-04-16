module AchievementCalculator

  class Hipster

    def initialize(achievement)
      @achievement = achievement
    end

    def calculate!
      return if achievement_is_invalid_for_hipster_badge?
      return if achievement_is_mainstream?
      return if user_already_hipster?
      hipster!
    end

    private

    attr_reader :achievement

    def hipster!
      Achievement.create!(badge: hipster_badge, user: user, description: desc)
    end

    def desc
      "You got the #{achievement.badge.description} badge before it was cool"
    end

    def user
      achievement.user
    end

    def hipster_badge
      @hipster_badge ||= Badge.find_by_name('hipster')
    end

    def achievement_is_invalid_for_hipster_badge?
      achievement.badge_name == hipster_badge.name
    end

    def achievement_is_mainstream?
      achievement.users.count > 1
    end

    def user_already_hipster?
      Achievement.where(user: user, badge: hipster_badge).count > 0
    end

  end

end
