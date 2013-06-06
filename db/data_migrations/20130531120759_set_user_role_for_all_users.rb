module DataMigration
  module MigrationFiles
    class SetUserRoleForAllUsers < Base

      def up
        User.where("slug NOT IN (?)", [ 'ash-mckenzie', 'stu-liston', 'dan-bradford']).update_all(role: 'user')
      end

      def down
        User.where("slug NOT IN (?)", [ 'ash-mckenzie', 'stu-liston', 'dan-bradford']).update_all(role: nil)
      end
    end
  end
end
