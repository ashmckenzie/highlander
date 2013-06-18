class TwitterNullDecorator

  def setup?; false end
  def handle; '' end
  def url; '' end

  private

  attr_reader :twitter_service
end
