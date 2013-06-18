require 'bundler'

class Database < Thor

  desc 'pull', 'Restores the local DB from Production (Heroku)'
  def pull(app = 'thequickening', db_name = 'highlander_development')
    @app = app
    @db_name = db_name

    capture
    download
    restore
  end

  private

  attr_reader :app, :db_name

  def capture
    puts '> Capturing a backup...'
    raise 'Unable to capture backup' unless system("heroku pgbackups:capture --expire --app #{app}")
    puts 'done.'
    puts
  end

  def download
    puts '> Downloading backup...'
    raise 'Unable to download backup' unless system("curl -o latest.dump `heroku pgbackups:url --app #{app}`")
    puts 'done.'
    puts
  end

  def restore
    puts '> Restoring your dev DB from backup...'
    system("pg_restore --verbose --clean --no-acl --no-owner -h localhost -d #{db_name} latest.dump")
    puts 'done.'
    puts '            $$\                                $$$$$$\                                 $$\
            $$ |                              $$  __$$\                                $$ |
 $$$$$$$\ $$$$$$\    $$$$$$\  $$\   $$\       $$ /  \__|$$$$$$\   $$$$$$\   $$$$$$$\ $$$$$$\   $$\   $$\
$$  _____|\_$$  _|   \____$$\ $$ |  $$ |      $$$$\    $$  __$$\ $$  __$$\ $$  _____|\_$$  _|  $$ |  $$ |
\$$$$$$\    $$ |     $$$$$$$ |$$ |  $$ |      $$  _|   $$ |  \__|$$ /  $$ |\$$$$$$\    $$ |    $$ |  $$ |
 \____$$\   $$ |$$\ $$  __$$ |$$ |  $$ |      $$ |     $$ |      $$ |  $$ | \____$$\   $$ |$$\ $$ |  $$ |
$$$$$$$  |  \$$$$  |\$$$$$$$ |\$$$$$$$ |      $$ |     $$ |      \$$$$$$  |$$$$$$$  |  \$$$$  |\$$$$$$$ |
\_______/    \____/  \_______| \____$$ |      \__|     \__|       \______/ \_______/    \____/  \____$$ |
                              $$\   $$ |                                                       $$\   $$ |
                              \$$$$$$  |                                                       \$$$$$$  |
                               \______/                                                         \______/ '
    puts
  end

end
