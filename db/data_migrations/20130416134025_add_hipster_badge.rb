module DataMigration
  module MigrationFiles
    class AddHipsterBadge < Base

      def up
        Badge.create!(name: 'hipster', tag: "You're so not mainstream", description: 'Hipster')
      end

      def down
        Badge.find_by_name('hipster').destroy
      end
    end
  end
end
