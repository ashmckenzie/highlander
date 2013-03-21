require 'twitter'
require 'net/http'
require File.expand_path('../../../config/initializers/twitter', __FILE__)

class TwitterIntegration < Thor

  desc 'scan_for_mentions', 'scans twitter for mentions of Hooroo'
  def scan_for_mentions

    tweets.each do |payload|
      req = Net::HTTP::Post.new(config.endpoint, initheader = { 'Content-Type' =>'application/json' })
      req.body = payload
      Net::HTTP.new(config.host, config.port).start { |http| http.request(req) }
    end
  end

  private

  def config
    TwitterConfig
  end

  def tweets
    twitter_client.mentions_timeline.collect do |status|
      {
        tweet_id: status.id,
        text: status.text,
        twitter_username: status.user.screen_name,
        followers_count: status.user.followers_count,
        metric: 'twitter_mention'
      }.to_json
    end
  end

  def metric
    'twitter_mention'
  end

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
