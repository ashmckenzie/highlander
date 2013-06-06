module DataMigration
  module MigrationFiles

    class MakeMikeBainTheBoss < Base

      def up
        badge = Badge.create!(name: 'mike_bain', tag: 'The One', description: 'Being Mike Bain')
        mike = User.find_by_name('Mike Bain')
        Achievement.create(badge: badge, user: mike)
      end

      def down
        Badge.find_by_name('mike_bain').destroy
      end
    end

  end
end
