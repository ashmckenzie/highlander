module DataMigration
  module MigrationFiles
    class AddBadges < Base

      def up
        Badge.create!(name: '1_twitter_mention', tag: 'Fly fly little birdie!', description: 'First Hooroo Twitter mention')
        Badge.create!(name: '25_twitter_mentions', tag: 'In a flutter', description: '25 Hooroo Twitter mentions')
        Badge.create!(name: '50_twitter_mentions', tag: 'Swoop in for the kill', description: '50 Hooroo Twitter Mentions')
      end

      def down
        Badge.destroy_all
      end
    end
  end
end
