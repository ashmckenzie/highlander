module Api

  class BaseController < ApplicationController
    protect_from_forgery with: :null_session

    before_filter :merge_request_ip_address_into_params!

    def merge_request_ip_address_into_params!
      params.merge!(request_ip_address: request_ip_address)
    end

    def request_ip_address
      env['HTTP_X_FORWARDED_FOR'] || env['HTTP_X_REAL_IP'] || env['REMOTE_ADDR']
    end

    rescue_from Errors::InvalidUserToken do
      render text: "User is not authorised", status: :unauthorized
    end

    rescue_from Errors::InvalidMetric do
      render text: "Metric '#{payload.metric.try(:name)}' is invalid", status: :error
    end

    rescue_from Errors::InvalidRequestSource do
      render text: "You are not authorised", status: :error
    end

    rescue_from Errors::InvalidGitBranch do
      # Render a HTTP 200 even though it's invalid so we don't annoy Github
      Rails.logger.info "Not processing Github push for '#{payload.email}' as it's for branch: '#{payload.branch}'"
      render text: '', status: :ok
    end

    rescue_from Errors::TweetAlreadyProcessed do
      Rails.logger.info "Not persisting tweet '#{payload.tweet_id}' for '#{payload.twitter_username}' as it's already been processed"
      render text: 'Tweet already processed', status: :ok
    end

  end

end