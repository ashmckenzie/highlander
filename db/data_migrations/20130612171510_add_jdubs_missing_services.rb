module DataMigration
  module MigrationFiles
    class AddJdubsMissingServices < Base

      def up
        james = User.find_or_initialize_by_name('James Wolstenholme')
        james.hooroo_email = 'jamesw@hooroo.com'
        james.save!

        twitter = Services::Twitter.new(username: 'jwolstenholme')
        github = Services::Github.new(username: 'jwolstenholme')
        UserService.create!(user: james, service: twitter)
        UserService.create!(user: james, service: github)
      end

      def down
      end

    end
  end
end
