module DataMigration
  module MigrationFiles
    class DisableMingPongLossMetric < Base

      def up
        Metric.find_by_name('ming_pong_loss').disable!
      end

      def down
        Metric.find_by_name('ming_pong_loss').enable!
      end
    end
  end
end
