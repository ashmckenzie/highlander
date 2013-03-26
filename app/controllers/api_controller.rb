class ApiController < ApplicationController

  class InvalidUserToken < RuntimeError ; end
  class InvalidMetric < RuntimeError ; end
  class InvalidRequestSource < RuntimeError ; end

  respond_to :json

  rescue_from InvalidUserToken do
    render text: "User is not authorised", status: :unauthorized
  end

  rescue_from InvalidMetric do
    render text: "Metric is invalid", status: :error
  end

  rescue_from InvalidRequestSource do
    render text: "You are not authorised", status: :error
  end

  before_filter :validate_current_user!, :set_default_format, :validate_metric

  skip_before_filter :verify_authenticity_token

  protected

  def current_user
    @current_user ||= User.point_earner.with_email(params[:email])
  end

  def validate_metric
    raise InvalidMetric unless valid_metrics.include?(metric_name)
  end

  def validate_request_source
    return true if valid_request_sources.empty?

    valid_request_sources.each do |ip_range|
      if ip_range.include?(request_ip_address)
        Rails.logger.info "MATCH on remote IP #{request_ip_address} against #{ip_range.inspect}"
        return true
      end
    end

    Rails.logger.info "NO match on remote IP #{request_ip_address}"

    raise InvalidRequestSource
  end

  private

  def validate_current_user!
    raise InvalidUserToken if current_user.nil?
  end

  def set_default_format
    request.format = 'json'
  end

  def new_event_for_user(metric, data: nil)
    current_user.events << Event.create(user: current_user, metric: metric, value: metric.default_unit, data: data)
  end

  def request_ip_address
    IPAddr.new(env['HTTP_X_FORWARDED_FOR'] || env['HTTP_X_REAL_IP'] || env['REMOTE_ADDR'])
  end

  def valid_request_sources
    []
  end

  def valid_metrics
    raise NotImplementedError
  end

  def metric_name
    raise NotImplementedError
  end
end
