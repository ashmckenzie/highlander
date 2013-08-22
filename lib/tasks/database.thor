require 'bundler'

class Database < Thor

  desc 'pull', 'Restores the local DB from Production (Heroku)'
  def pull(app = 'thequickening')
    @app = app

    capture
    download
    restore
  end

  private

  attr_reader :app

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
    system("pg_restore --verbose --clean --no-acl --no-owner -h localhost -d highlander_development latest.dump")
    puts 'done.'
    puts '  $$\                                $$$$$$\                                 $$\
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
