module Queries

  class UsersWithBadge

    def initialize(badge: badge)
      @badge = badge
    end

    def each(&block)
      query.each(&block)
    end

    def query
     badge
      .achievements
      .order('achievements.created_at ASC')
      .map { |x| User.unscoped { x.user.decorate } }
    end

    private

    attr_reader :badge

  end
end
