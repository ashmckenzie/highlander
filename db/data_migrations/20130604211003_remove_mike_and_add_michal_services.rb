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

        twitter_service = Services::Twitter.new(username: 'mpisanko')
        michal.user_services << UserService.new(service: twitter_service)

        github_service = Services::Github.new(username: 'mpisanko', emails: michal.emails)
        michal.user_services << UserService.new(service: github_service)

        pager_duty_service = Services::PagerDuty.new(email: michal.hooroo_email)
        michal.user_services << UserService.new(service: pager_duty_service)
      end

      def down
        User.find_by_name('Michal Pisanko').try(:destroy)
      end
    end
  end
end
