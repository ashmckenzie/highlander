module DataMigration
  module MigrationFiles
    class AddMichalsGithubEmail < Base

      def up
        u = User.find('michal-pisanko')
        u.emails = u.emails + [ 'mpisanko@gmail.com' ]
        u.save!
      end

      def down
      end

    end
  end
end
