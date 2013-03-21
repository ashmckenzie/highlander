require 'hashie'

env = ENV['RAILS_ENV'] || 'development'
file = File.expand_path('../../adapters/twitter.yml',__FILE__)
config = Hashie::Mash.new(YAML.load_file(file))

TwitterConfig = config.fetch(env)

Twitter.configure do |c|
  c.consumer_key = TwitterConfig.consumer_key
  c.consumer_secret = TwitterConfig.consumer_secret
  c.oauth_token = TwitterConfig.oauth_token
  c.oauth_token_secret = TwitterConfig.oauth_token_secret
end
