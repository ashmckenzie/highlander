module DataMigration
  module MigrationFiles
    class CorrectHipsterBadge < Base

      def up
        b = Badge.find_by_name('hipster')
        b.name = 'Hipster'
        b.save!
      end

      def down
        b = Badge.find_by_name('Hipster')
        b.name = 'hipster'
        b.save!
      end
    end
  end
end
