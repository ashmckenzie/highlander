module DataMigration
  module MigrationFiles
    class SetRelatedMetricsForBadges < Base

      def up
        {
          'twitter_mention' => '%_twitter_mention%'

        }.each do |metric, match|
          Badge.where("name LIKE ?", match).update_all(related_metric: metric)
        end
      end

      def down
        execute('UPDATE badges set related_metric = NULL')
      end
    end
  end
end
