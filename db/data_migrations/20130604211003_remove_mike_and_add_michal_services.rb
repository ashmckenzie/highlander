module DataMigration
  module MigrationFiles
    class RemoveMikeAndAddMichalServices < Base

      def up
        mike = User.find_by_name('Mike Bain')
        mike.try(:disable!)

        michal = User.find_or_initialize_by_name('Michal Pisanko')
        michal.hooroo_email = 'michal@hooroo.com'
        michal.emails = [ 'michal@hooroo.com' ]
        michal.bio = 'The Pole'
        michal.save!

        twitter = Services::Twitter.new(username: 'mpisanko')
        github = Services::Github.new(username: 'mpisanko')
        pager_duty = Services::PagerDuty.new(email: michal.hooroo_email)

        UserService.create!(user: michal, service: twitter)
        UserService.create!(user: michal, service: github)
        UserService.create!(user: michal, service: pager_duty)
      end

      def down
        User.find_by_name('Michal Pisanko').try(:destroy)
      end

    end
  end
end
