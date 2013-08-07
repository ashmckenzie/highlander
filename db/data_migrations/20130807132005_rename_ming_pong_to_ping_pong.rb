module DataMigration
  module MigrationFiles
    class RenameMingPongToPingPong < Base

      def up
        Metric.where(name: 'ming_pong_victory').first.update(name: 'ping_pong_victory', description: 'Ping Pong victory')
        Badge.where(related_metric: 'ming_pong_victory').each do |badge|
          new_name = badge.name.gsub(/ming/, 'ping')
          new_slug = badge.slug.gsub(/ming/, 'ping')
          new_description = badge.description.gsub(/Ming/, 'Ping')
          badge.update(name: new_name, slug: new_slug, description: new_description, related_metric: 'ping_pong_victory')
        end
      end

      def down
        Metric.where(name: 'ping_pong_victory').first.update(name: 'ming_pong_victory', description: 'Ming Pong victory')
        Badge.where(related_metric: 'ping_pong_victory').each do |badge|
          new_name = badge.name.gsub(/ping/, 'ming')
          new_slug = badge.slug.gsub(/ping/, 'ming')
          new_description = badge.description.gsub(/Ping/, 'Ming')
          badge.update(name: new_name, slug: new_slug, description: new_description, related_metric: 'ming_pong_victory')
        end
      end
    end
  end
end
