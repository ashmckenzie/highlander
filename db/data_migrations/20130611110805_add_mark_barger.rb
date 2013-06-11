module DataMigration
  module MigrationFiles
    class AddMarkBarger < Base

      def up
        mark = User.create!(hooroo_email: 'mark@hooroo.com', emails: ['barger.mark@gmail.com'], avatar_email: 'barger.mark@gmail.com', name: 'Mark Barger', bio: 'Development Operations Engineer, Agile, DevOps, Metrics, Lean & Performance.')
        twitter = Services::Twitter.create!(username: 'mark_barger')
        github = Services::Github.create!(username: 'markba')
        UserService.create!(user: mark, service: twitter)
        UserService.create!(user: mark, service: github)
      end

      def down
        User.where(hooroo_email: 'mark@hooroo.com').destroy_all
      end
    end
  end
end
