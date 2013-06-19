module DataMigration
  module MigrationFiles
    class FixTwitterAvatarUrls < Base

      def up
        User.all.each do |user|
          avatar_url = user.avatar_url.gsub(/^(.+profile_images\/\d+\/)([^\.]+)(.*)/, '\1\2_bigger\3')
          user.update(avatar_url: avatar_url)
        end
      end

      def down
      end
    end
  end
end
