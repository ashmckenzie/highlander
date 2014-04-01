module DataMigration
  module MigrationFiles
    class DisableMingPongBadges < Base

      def up
        Badge.where("name LIKE '%_ming_pong_loss'").each { |x| x.disable! }
      end

      def down
        Badge.where("name LIKE '%_ming_pong_loss'").each { |x| x.enable! }
      end
    end
  end
end
