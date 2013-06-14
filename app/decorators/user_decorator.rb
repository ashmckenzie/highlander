class UserDecorator < Draper::Decorator

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

  class TwitterNullDecorator

    def setup?
      false
    end

    def handle
      ''
    end

    def url
      ''
    end

    private

    attr_reader :twitter_service
  end

  class TwitterDecoratorFactory

    def self.setup_for twitter_service
      if twitter_service
        TwitterDecorator.new(twitter_service)
      else
        TwitterNullDecorator.new
      end
    end
  end

  #----------------------------------------------------------------------------#

  alias :user :source
  delegate_all

  def twitter
    @twitter ||= TwitterDecoratorFactory.setup_for(user.service_for(:twitter))
  end

  def twitter_url
  end

  def email
    hooroo_email || ''
  end

  def avatar_email
    user.avatar_email || email
  end

  def achievements
    Queries::AchievementsAndBadgeTakeupForUser.new(user).query.decorate
  end

  def avatar_url size=80
    gravatar_id = Digest::MD5::hexdigest(avatar_email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def bio
    user.bio || "#{first_name} hasn't added a bio yet"
  end

  def first_name
    name.split(' ').first
  end

  def id_or_slug
    user.slug.present? ? user.slug : user.id
  end

  def last_event_created_at
    if user.events.first
      "Last updated on #{user.events.first.created_at.strftime("%B %-d, %Y at %-l:%M %P")}"
    else
      ''
    end
  end
end
