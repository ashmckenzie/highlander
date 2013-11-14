module DataMigration
  module MigrationFiles
    class AddVictorNava < Base

      def up
        victor = User.find_or_initialize_by(name: 'Victor Nava')
        victor.hooroo_email = 'victor@hooroo.com'
        victor.avatar_email = 'victornavav@gmail.com'
        victor.emails = [ 'victor@hooroo.com', 'victornavav@gmail.com' ]
        victor.save!

        github = Services::Github.new(username: 'victornava', emails: ["victornavav@gmail.com", "victor@hooroo.com"])
        UserService.create!(user: victor, service: github)
      end

      def down
      end
    end
  end
end
