require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Assets should be precompiled for production (so we don't need the gems loaded then)
# Bundler.require(*Rails.groups(assets: %w(development test)))

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  # Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  Bundler.require(:default, :assets, Rails.env)
end

module Highlander
  class Application < Rails::Application
    config.time_zone = 'UTC'
    config.active_record.observers = :event_observer

    #sass, beeeatch
    config.sass.preferred_syntax = :sass

  end
end
