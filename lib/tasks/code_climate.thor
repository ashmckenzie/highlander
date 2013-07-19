require File.expand_path('../../code_climate/load.rb', __FILE__)
require 'octokit'
require 'ostruct'

class CodeClimateIntegration < Thor

  desc 'scrape_activity_feed', 'Scrapes the Code Climate feed'
  method_options force: :boolean
  def scrape_activity_feed(env, app_id, email, password, github_repo_name, github_username, github_password)
    @env = env

    account_info = CodeClimate::AccountInfo.new(
      app_id:   app_id,
      email:    email,
      password: password
    )

    scraper   = CodeClimate::Scraper.new(account_info)
    from_date = DateTime.parse('1900-01-01') if options.force?

    feed = CodeClimate::Feed.new(scraper, from_date)
    feed.update!

    github_client = Octokit::Client.new(login: github_username, password: github_password)

    # DAFUQ! Might be worth injecting the client and feed into a service to patch up authors
    feed.improvements.each do |entry|

      # get the comparison from GitHub
      comparison = github_client.compare(github_repo_name, entry.from_sha, entry.to_sha)

      authors   = comparison.commits.collect(&:author).compact.collect(&:login).uniq

      authors.each do |author|
        data = entry.to_h.merge(user: author)

        req = Net::HTTP::Post.new(config.endpoint, initheader = { 'Content-Type' =>'application/json' })
        req.body = data.to_json
        Net::HTTP.new(config.host, config.port).start { |http| http.request(req) }
      end
    end

  end

  private

  attr_reader :env

  def development?
    env == 'development'
  end

  def config
    @config ||= OpenStruct.new(
      endpoint: '/api/code_quality_improvement.json',
      host:     host,
      port:     port
    )
  end

  def host
    development? ? 'localhost' : 'hooroo.hilander.io'
  end

  def port
    development? ? 3000 : 80
  end

end
