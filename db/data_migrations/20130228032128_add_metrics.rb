module DataMigration
  module MigrationFiles
    class AddMetrics < Base

      def up
        Metric.create!(name: 'github_push', description: 'GitHub push')
        Metric.create!(name: 'jenkins_green_job', description: 'Jenkins green job')
        Metric.create!(name: 'ming_pong_loss', description: 'Ping Pong loss')
        Metric.create!(name: 'ming_pong_victory', default_unit: 2, description: 'Ping Pong victory')
        Metric.create!(name: 'gift', description: 'A gift - good or bad!')
        Metric.create!(name: 'express_yaself', description: 'Expressed Yaself!')
        Metric.create!(name: 'twitter_mention', description: 'Twitter mention', default_unit: 10)
      end

      def down
        Metric.destroy_all
      end
    end
  end
end
