module DataMigration
  module MigrationFiles
    class AddJacobEvans < Base

      def up
        rob = User.find_or_initialize_by(hooroo_email: 'jacob@hooroo.com').tap do |r|
          r.name          = 'Jacob Evans'
          r.emails        = ['jacob@hooroo.com', 'jacob@dekz.net']
          r.avatar_email  = 'jacob@hooroo.com'
          r.role          = 'user'
        end

        ghs = Services::Github.new(username: 'jacob', emails: ['jacob@dekz.net'])
        pds = Services::PagerDuty.new(email: 'jacob@hooroo.com')
        ts  = Services::Twitter.new(username: 'dekz')

        rob.user_services = [
          UserService.new(service: ghs),
          UserService.new(service: pds),
          UserService.new(service: ts)
        ]

        rob.save!
      end

      def down
      end

    end
  end
end
