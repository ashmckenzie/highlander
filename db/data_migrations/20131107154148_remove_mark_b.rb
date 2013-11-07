module DataMigration
  module MigrationFiles
    class RemoveMarkB < Base

      def up
        User.with_email('mark@hooroo.com').left_hooroo!
      end

      def down
        # No down!
      end
    end
  end
end
