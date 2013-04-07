module PayloadValidators

  class GithubPush < Base

    MASTER_GIT_BRANCH = 'refs/heads/master'

    def validate!
      super
      raise Errors::InvalidGitBranch.new(payload) unless payload.branch == MASTER_GIT_BRANCH
    end

    private

    def valid_request_sources
      %w{
        127.0.0.1/32
        207.97.227.253/32
        50.57.128.197/32
        108.171.174.178/32
        50.57.231.61/32
        204.232.175.64/27
        192.30.252.0/22

      }.map do |ip|
       IPAddr.new(ip).to_range
      end
    end

  end

end
