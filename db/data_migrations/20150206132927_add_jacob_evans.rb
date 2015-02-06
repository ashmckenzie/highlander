module DataMigration
  module MigrationFiles
    class AddJacobEvans < Base

      def up
        user = User.find_or_initialize_by(hooroo_email: 'jacob@hooroo.com').tap do |r|
          r.name          = 'Jacob Evans'
          r.emails        = ['jacob@hooroo.com', 'jacob@dekz.net']
          r.avatar_email  = 'jacob@dekz.net'
          r.role          = 'user'
        end

        ghs = Services::Github.create!(username: 'dekz', emails: ['jacob@dekz.net'])
        pds = Services::PagerDuty.create!(email: 'jacob@hooroo.com')
        ts  = Services::Twitter.create!(username: 'dekz')

        UserService.create!(user: user, service: ghs)
        UserService.create!(user: user, service: pds)
        UserService.create!(user: user, service: ts)
      end

      def down
      end

    end
  end
end
