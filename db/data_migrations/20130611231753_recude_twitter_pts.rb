module DataMigration
  module MigrationFiles
    class RecudeTwitterPts < Base

      def up
        execute "update metrics set default_unit = 2 where name = 'twitter_mention';"
      end

      def down
        execute "update metrics set default_unit = 10 where name = 'twitter_mention';"
      end

    end
  end
end
