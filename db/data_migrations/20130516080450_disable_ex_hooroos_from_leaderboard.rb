module DataMigration
  module MigrationFiles
    class DisableExHooroosFromLeaderboard < Base

      USERS = [
        'mike@hooroo.com',
        'kunal@hooroo.com',
        'james@hooroo.com'

      ].inject([]) do |users, email|
        if user = User.with_email(email)
          users << user
        end
        users
      end

      def up
        USERS.each do |user|
          user.left_hooroo!
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
