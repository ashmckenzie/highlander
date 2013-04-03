module Api

  class BaseController < ApplicationController

    before_filter :merge_request_ip_address_into_params

    def merge_request_ip_address_into_params
      params.merge(request_ip_address: request_ip_address)
    end

    def request_ip_address
      IPAddr.new(env['HTTP_X_FORWARDED_FOR'] || env['HTTP_X_REAL_IP'] || env['REMOTE_ADDR'])
    end

    rescue_from InvalidUserToken do
      render text: "User is not authorised", status: :unauthorized
    end

    rescue_from InvalidMetric do
      render text: "Metric is invalid", status: :error
    end

    rescue_from InvalidRequestSource do
      render text: "You are not authorised", status: :error
    end

    rescue_from InvalidGitBranch do
      # Render a HTTP 200 even though it's invalid so we don't annoy Github
      Rails.logger.info "Not processing Github push for '#{email}' as it's for '#{git_branch}'"
      render text: '', status: :ok
    end

    rescue_from TweetAlreadyProcessed do
      Rails.logger.info "Not persisting tweet '#{current_tweet[:tweet_id]}' for '#{current_tweet[:twitter_username]}' as it's already been processed"
      render text: 'Tweet already processed', status: :ok
    end

  end

end