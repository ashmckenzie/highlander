class TwitterDecorator

  def initialize twitter_service
    @twitter_service = twitter_service
  end

  def setup?
    true
  end

  def handle
    '@' << twitter_service.username
  end

  def url
    "//twitter.com/#{twitter_service.username}"
  end

  private

  attr_reader :twitter_service
end
