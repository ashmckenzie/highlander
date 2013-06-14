module DataMigration
  module MigrationFiles
    class EnsureRolesAreCorrect < Base

      def up
        User.where(role: 'guest').each { |x| x.update(role: 'user') }
      end

      def down
      end
    end
  end
end
