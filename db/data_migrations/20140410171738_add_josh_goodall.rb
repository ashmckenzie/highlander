module DataMigration
  module MigrationFiles
    class AddJoshGoodall < Base

      def up
        rob = User.find_or_initialize_by(hooroo_email: 'josh@hooroo.com').tap do |r|
          r.name          = 'Josh Goodall'
          r.emails        = ['josh@hooroo.com']
          r.avatar_email  = 'joshua@qutonic.com'
          r.role          = 'user'
        end

        ghs = Services::Github.new(username: 'josh', emails: ['joshua@qutonic.com'])
        pds = Services::PagerDuty.new(email: 'josh@hooroo.com')
        ts  = Services::Twitter.new(username: 'josh')

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
