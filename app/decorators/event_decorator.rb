class EventDecorator < Draper::Decorator

  alias :event :source
  delegate_all

  def serialised
    {
      id: id,
      value: value,
      user: decorated_user.serialised,
      metric: decorated_metric.serialised,
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
