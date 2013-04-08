module DataMigration
  module MigrationFiles
    class MakeJenkimsGreenJobWorthFivePoints < Base

      def up
        execute "update metrics set default_unit = 5 where name = 'jenkins_green_job';"
      end

      def down
        execute "update metrics set default_unit = 1 where name = 'jenkins_green_job';"
      end
    end
  end
end
