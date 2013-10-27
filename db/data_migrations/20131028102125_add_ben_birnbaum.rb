module DataMigration
  module MigrationFiles
    class AddBenBirnbaum < Base

      def up
        ben = User.find_or_initialize_by_name('Ben Birnbaum')
        ben.hooroo_email = 'benb@hooroo.com'
        ben.avatar_email = 'benjamin@wobolando.com'
        ben.emails = [ 'benb@hooroo.com' ]
        ben.save!

        github = Services::Github.new(username: 'benb')
        UserService.create!(user: ben, service: github)
      end

      def down
      end
    end
  end
end
