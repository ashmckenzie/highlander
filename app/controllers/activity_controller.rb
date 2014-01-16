class ActivityController < ApplicationController

  # load_and_authorize_resource

  include ActionController::Live

  respond_to :json

  def index
  end

  def current
    respond_to do |format|
      format.json {
        render json: activity_feed.current_activity
      }
    end
  end

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Connection'] = 'keep-alive'

    feed = Thread.new do
     activity_feed.subscribe('*') do |on|
        on.pmessage do |pattern, event, data|
          response.stream.write("event: #{event}\n")
          response.stream.write("data: #{data}\n\n")
        end
      end
    end

    feed.join

  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
    Thread.kill(feed) if feed
  end

  private

    def activity_feed
      @activity_feed ||= ActivityFeed.new
    end

end
