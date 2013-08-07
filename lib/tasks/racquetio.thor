require 'net/http'
require 'ostruct'
require 'json'

class RaquetioIntegration < Thor

  desc 'check_for_results', 'checks Racquet.io for new results'
  def check_for_results(env)
    @env = env

    matches['results'].each do |payload|
      req = Net::HTTP::Post.new(hldr_config.victory_endpoint, initheader = { 'Content-Type' =>'application/json' })
      req.body = payload.to_json
      Net::HTTP.new(hldr_config.host, hldr_config.port).start { |http| http.request(req) }
    end
  end

  private

  attr_reader :env

  def development?
    env == 'development'
  end

  def matches
    @matches ||= JSON.parse(results.body)
  end

  def results
    req = Net::HTTP::Get.new(rio_config.endpoint, initheader = { 'Content-Type' =>'application/json' })
    results = Net::HTTP.new(rio_config.host, rio_config.port).start { |http| http.request(req) }
  end

  def rio_config
    @rio_config ||= OpenStruct.new(
      endpoint: "/hooroo/matches.json?limit=#{limit}",
      host:     'racquet.io',
      port:     80
    )
  end

  def limit
    ENV.fetch('LIMIT', 100)
  end

  def hldr_config
    @hldr_config ||= OpenStruct.new(
      victory_endpoint: '/api/ping_pong_victory.json',
      loss_endpoint:    '/api/ping_pong_loss.json',
      host:             hldr_host,
      port:             hldr_port
    )
  end

  def hldr_host
    development? ? 'localhost' : 'hooroo.hilander.io'
  end

  def hldr_port
    development? ? 3000 : 80
  end

end
