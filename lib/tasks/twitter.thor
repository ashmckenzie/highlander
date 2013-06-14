require 'twitter'
require 'net/http'
require 'ostruct'

class TwitterIntegration < Thor

  desc 'scan_for_agile_aus', 'scans Twitter for #Agileaus tweets'
  def scan_for_agile_aus(env, consumer_key, consumer_secret, oauth_token, oauth_token_secret)
    @env = env

    Twitter.configure do |c|
      c.consumer_key        = consumer_key
      c.consumer_secret     = consumer_secret
      c.oauth_token         = oauth_token
      c.oauth_token_secret  = oauth_token_secret
    end

    # tweets.each do |tweet|
      # req = Net::HTTP::Post.new(config.endpoint, initheader = { 'Content-Type' =>'application/json' })
      # req.body = tweet
      # Net::HTTP.new(config.host, config.port).start { |http| http.request(req) }
    # end

    require 'pry'
    binding.pry
  end

  private

  attr_reader :env

  def development?
    env == 'development'
  end

  def config
    @config ||= OpenStruct.new(
      endpoint: '/api/twitter_mention.json',
      host:     host,
      port:     port
    )
  end

  def host
    development? ? 'localhost' : 'agile-aus-2013.leaderboard.hooroo.com'
  end

  def port
    development? ? 3000 : 80
  end

  def tweets
    twitter_client.search('#Agileaus', count: 50).results.collect do |result|
      {
        tweet_id: result.id,
        text: result.text,
        twitter_username: result.user.screen_name
      }.to_json
    end
  end

  def twitter_client
    @twitter_client ||= Twitter::Client.new
  end

end
