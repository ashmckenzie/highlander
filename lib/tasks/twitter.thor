require 'twitter'
require 'awesome_print'
require 'pry'
require 'net/http'

Twitter.configure do |config|
  config.consumer_key = '880G7hBnwBBF11lFxMV3Q'
  config.consumer_secret = 'aJzve69D6tToEeVadOUCgAbCxnET9DHaOUt0ZPwH2hg'
  config.oauth_token = '66106097-9ICLkzdFqHBcFsW3bOGnfKtiKWPvSgb9WcEElUFHa'
  config.oauth_token_secret = '2LWooYZ9Mrb3UoclySShppaPUlsbYBpsgG7NzsLhRRI'
end

class TwitterIntegration < Thor

  desc 'scan_for_mentions', 'scans twitter for mentions of Hooroo'
  def scan_for_mentions

    #twitter_client.search('#hooroo', result_type: "recent").results.each do |status|
    tweets = twitter_client.mentions_timeline.collect do |status|
      {
        tweet_id: status.id,
        text: status.text,
        twitter_username: status.user.screen_name,
        followers_count: status.user.followers_count,
        metric: 'twitter_mention'
      }.to_json
    end

    host = '0.0.0.0'
    port = 3000
    endpoint = '/api/events.json'
    metric = 'twitter_mention'

    tweets.each do |payload|
      req = Net::HTTP::Post.new(endpoint, initheader = {'Content-Type' =>'application/json'})
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