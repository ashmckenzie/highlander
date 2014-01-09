module DataMigration
  module MigrationFiles
    class Add250PingPongBadge < Base

      def up
        Badge.create!(name: '250_ming_pong_victories', tag: 'Paddle guru', description: '250 Ping Pong victories')
      end

      def down
        Badge.where(name: '250_ming_pong_victories').destroy_all
      end
    end
  end
end
