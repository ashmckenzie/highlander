module DataMigration
  module MigrationFiles
    class SetInitialPositionForBadges < Base

      def up
        Badge.all.each do |badge|
          badge.update(position: badge.created_at.to_i)
        end
      end

      def down
        execute('UPDATE badges set position = 0')
      end
    end
  end
end
