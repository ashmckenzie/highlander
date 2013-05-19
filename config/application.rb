require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  # Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  Bundler.require(:default, Rails.env)
end

module Highlander
  class Application < Rails::Application
    config.time_zone = 'Melbourne'
    config.active_record.observers = [ :event_observer, :user_observer, :achievement_observer ]

    #fonts path
    config.assets.paths << "#{Rails.root}/app/assets/fonts"

    #sass, beeeatch
    config.sass.preferred_syntax = :sass

    config.autoload_paths << File.join(Rails.root, 'lib')

    config.generators do |g|
      g.fixture_replacement :factory_girl
    end
  end
end
