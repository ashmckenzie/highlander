# Source: http://michaeldwan.com/writings/customize-your-heroku-deployment.html
# Helpful: https://github.com/sstephenson/rbenv/issues/400#issuecomment-18744931

require 'bundler'

class Heroku < Thor

  desc 'deploy', 'Deploys to heroku'
  def deploy(heroku_remote, local_branch, app)
    @heroku_remote = heroku_remote
    @local_branch = local_branch
    @app = app

    before_deploy
    heroku_push
    after_deploy
  end

  private

  attr_reader :heroku_remote, :local_branch, :app

  def before_deploy
    puts '> Running before_deploy tasks...'
    puts
  end

  def heroku_push
    puts '> Pushing new code to Heroku...'
    raise 'Unable to push new code to Heroku' unless system("git push #{heroku_remote} #{local_branch}:master")
    puts
  end

  def after_deploy
    puts '> Running after_deploy tasks...'
    update_release_git_sha
    schema_and_data_migrations
  end

  #--------------------------------------------------------------------------#

  def update_release_git_sha
    puts '>> Updating the RELEASE_GIT_SHA config variable to the latest git SHA...'
    git_sha = `git rev-parse HEAD`.chomp
    raise 'Unable to set RELEASE_GIT_SHA config variable' unless Bundler.with_clean_env { system("heroku config:set RELEASE_GIT_SHA=#{git_sha} --app #{app}") }
    puts
  end

  def schema_and_data_migrations
    puts '>> Running schema/data migrations...'
    raise 'Unable to run schema and/or data migrations' unless Bundler.with_clean_env { system("heroku run rake db:migrate db:data_migrate --app #{app}") }
    puts
  end
end
