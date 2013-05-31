module DataMigration
  module MigrationFiles
    class SetAdminToAppropriateUsers < Base

      def up
        User.where("slug in (?)", [ 'ash-mckenzie', 'stu-liston', 'dan-bradford']).update_all(role: 'admin')
      end

      def down
        execute("UPDATE users set role = NULL")
      end
    end
  end
end
