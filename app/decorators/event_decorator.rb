class EventDecorator < Draper::Decorator

  alias :event :source
  delegate_all

  def serialised
    {
      id: id,
      value: value,
      user: {
        id: decorated_user.id,
        name: decorated_user.name,
        avatar_url: decorated_user.avatar_url
      },
      metric: {
        id: metric.id,
        name: metric.name,
        description: metric.description
      },
      created_at: created_at,
      updated_at: updated_at
    }
  end

  private

    def decorated_user
      @decorated_user ||= UserDecorator.new(user)
    end

    def decorated_metric
      @decorated_metric ||= MetricDecorator.new(metric)
    end

end
