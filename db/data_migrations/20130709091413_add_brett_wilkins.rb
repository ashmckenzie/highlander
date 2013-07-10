module DataMigration
  module MigrationFiles
    class AddBrettWilkins < Base

      def up
        brett = User.find_or_initialize_by_name('Brett Wilkins')
        brett.hooroo_email = 'brett@hooroo.com'
        brett.emails = [ 'brett@hooroo.com', 'brett@brett.geek.nz' ]
        brett.save!

        twitter = Services::Twitter.new(username: 'bjmaz')
        github = Services::Github.new(username: 'bwilkins')
        UserService.create!(user: brett, service: twitter)
        UserService.create!(user: brett, service: github)
      end

      def down
      end

    end
  end
end
