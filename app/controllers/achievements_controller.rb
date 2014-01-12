class AchievementsController < ApplicationController

  include ActionController::Live

  respond_to :json

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Connection'] = 'keep-alive'

    ActivityFeed.new.subscribe('achievements') do |on|
      on.pmessage do |pattern, event, data|
        response.stream.write("event: #{event}\n")
        response.stream.write("data: #{data}\n\n")
      end
    end

  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
  end
end
