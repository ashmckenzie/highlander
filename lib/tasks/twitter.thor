require 'twitter'
require 'net/http'

Twitter.configure do |config|
  config.consumer_key = 'tftvBCthb2Dzx6ccIAYkg'
  config.consumer_secret = '2JI0mCn7hxJhmExU4jPBFox5wcfcPBQ059P6mAKkhg'
  config.oauth_token = '15657534-DAClAfBX6VWiosAY4QDUCqP1DY9HFbo0d5HIZzyEr'
  config.oauth_token_secret = 'Apj4Y7iEEqQJRxKWAOkuWSeoJAJSIz8P0YpS2Ys'
end

class TwitterIntegration < Thor

  desc 'scan_for_mentions', 'scans twitter for mentions of Hooroo'
  def scan_for_mentions

    tweets = twitter_client.mentions_timeline.collect do |status|
      {
        tweet_id: status.id,
        text: status.text,
        twitter_username: status.user.screen_name,
        followers_count: status.user.followers_count,
        metric: 'twitter_mention'
      }.to_json
    end

    host = 'leaderboard.hooroo.com'
    port = 80
    endpoint = '/api/adapters/twitter.json'
    metric = 'twitter_mention'

    # TODO: Perhaps we need a twitter.yml config that has development / production keys ?
    #
    # host = '0.0.0.0'
    # port = 3000
    # endpoint = '/api/adapters/twitter.json'
    # metric = 'twitter_mention'

    tweets.each do |payload|
      req = Net::HTTP::Post.new(endpoint, initheader = { 'Content-Type' =>'application/json' })
      req.body = payload
      Net::HTTP.new(host, port).start { |http| http.request(req) }
    end
  end

  private

  def twitter_client
    @twitter_client ||= begin
      # Bypass bug in Net::HTTP
      # See: https://github.com/sferik/twitter/issues/369
      middleware = Proc.new do |builder|
        builder.use Twitter::Request::MultipartWithFile
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.use Twitter::Response::RaiseError, Twitter::Error::ClientError
        builder.use Twitter::Response::ParseJson
        builder.use Twitter::Response::RaiseError, Twitter::Error::ServerError
        builder.adapter :typhoeus
      end
      Twitter::Client.new(:middleware => Faraday::Builder.new(&middleware))
    end
  end

end
