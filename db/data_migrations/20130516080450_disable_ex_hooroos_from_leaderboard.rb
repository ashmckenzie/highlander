module DataMigration
  module MigrationFiles
    class DisableExHooroosFromLeaderboard < Base

      USERS = [
        'mike@hooroo.com',
        'kunal@hooroo.com',
        'james@hooroo.com'

      ].map do |email|
        User.with_email(email)
      end

      def up
        USERS.each do |user|
          user.update(leaderboarder: false, earns_points: false)
        end
      end

      def down
        USERS.each do |user|
          user.update(leaderboarder: true, earns_points: true)
        end
      end
    end
  end
end
