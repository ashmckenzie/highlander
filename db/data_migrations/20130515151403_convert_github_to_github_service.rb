module DataMigration
  module MigrationFiles
    class ConvertGithubToGithubService < Base

      def up
        User.where("github_username is NOT NULL AND github_username != ''").each do |user|
          github_service = Services::Github.new(username: user.github_username, emails: user.emails)
          user.user_services << UserService.new(service: github_service)
        end
      end

      def down
        Services::Twitter.destroy_all
      end
    end
  end
end
