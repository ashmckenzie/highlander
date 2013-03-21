class Tweet

  def initialize(data)
    @data = data
  end

  def id
    data['tweet_id']
  end

  def text
    data['text']
  end

  def username
    data['twitter_username']
  end

  def followers
    data['followers_count']
  end

  private

  attr_reader :data

end