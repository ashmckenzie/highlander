module AchievementCalculators
  class GitHubCommit
    def initialize event
      @event = event
    end

    def calculate!
      case user.events_for_metric(metric).count
      when 1
        user.achievements << Achievement.create(badge: one_hundred_commits_badge)
      when 5
        user.achievements << Achievement.create(badge: five_hundred_commits_badge)
      end
    end

    private

    def user
      event.user
    end

    def metric
      event.metric
    end

    def one_hundred_commits_badge
      Badge.where(name: '100_github_commits').first
    end

    def five_hundred_commits_badge
      Badge.where(name: '100_github_commits').first
    end

    attr_reader :event
  end
end
