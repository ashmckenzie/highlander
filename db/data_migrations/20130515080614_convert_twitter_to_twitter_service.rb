module DataMigration
  module MigrationFiles
    class ConvertTwitterToTwitterService < Base

      def up
        # User.where('twitter_username is NOT NULL').each do |user|
        #   twitter_service = Services::Twitter.new(username: user.twitter_username)
        #   user.user_services << UserService.new(service: twitter_service)
        # end
      end

      def down
        # Services::Twitter.destroy_all
      end
    end
  end
end
