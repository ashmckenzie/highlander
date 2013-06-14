module DataMigration
  module MigrationFiles
    class AddBadges < Base

      def up
        Badge.create!(name: 'first_time', tag: 'Experience the quickening', description: 'First timer')

        Badge.create!(name: '1_twitter_mention', tag: 'Fly fly little birdie!', description: 'First Agile Australia 2013 Twitter mention')
        Badge.create!(name: '25_twitter_mentions', tag: 'In a flutter', description: '25 Agile Australia 2013 Twitter mentions')
        Badge.create!(name: '50_twitter_mentions', tag: 'Swoop in for the kill', description: '50 Agile Australia 2013 Twitter Mentions')
      end

      def down
        Badge.destroy_all
      end
    end
  end
end
