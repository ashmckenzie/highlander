module DataMigration
  module MigrationFiles
    class AddMichaelChapman < Base

      def up
        user = User.find_or_initialize_by(hooroo_email: 'michaelc@hooroo.com').tap do |r|
          r.name          = 'Michael Chapman'
          r.emails        = ['michael@hooroo.com', 'michael@elitedatabases.com.au']
          r.avatar_email  = 'michaecl@hooroo.com'
          r.role          = 'user'
        end

        ghs = Services::Github.create!(username: 'mchapman17', emails: ['michael@elitedatabases.com.au'])
        pds = Services::PagerDuty.create!(email: 'michaelc@hooroo.com')
        ts  = Services::Twitter.create!(username: 'mchapman17')

        UserService.create!(user: user, service: ghs)
        UserService.create!(user: user, service: pds)
        UserService.create!(user: user, service: ts)
      end

      def down
      end

    end
  end
end
