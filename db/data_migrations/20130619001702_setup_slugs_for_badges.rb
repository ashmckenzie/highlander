module DataMigration
  module MigrationFiles
    class SetupSlugsForBadges < Base

      def up
        Badge.all.each do |badge|
          slug = badge.name.gsub(/_/, '-')
          badge.update(slug: slug)
        end
      end

      def down
        execute('UPDATE badges set slug = NULL')
      end
    end
  end
end
