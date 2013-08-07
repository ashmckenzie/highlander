require 'spec_helper'

feature 'Github Issue Closed' do

  given(:endpoint) { '/api/github_issue_closed.json' }

  background do
    @first_time_badge                         = FactoryGirl.create(:first_time)
    @one_github_issue_closed_badge            = FactoryGirl.create(:one_github_issue_closed)
    @twenty_five_github_issues_closed_badge   = FactoryGirl.create(:twenty_five_github_issues_closed)
  end

  given!(:user)           { FactoryGirl.create(:user, :githubber) }
  given!(:github_service) { user.service_for(:github) }
  given!(:metric)         { FactoryGirl.create(:github_issue_closed) }

  given(:valid_params)    { GithubPayloads.issue_closed(github_service.username) }

  describe 'First closed issue' do

    background { page.driver.post endpoint, valid_params }

    scenario 'User is given the First Github Issue Closed and First Timer badges' do
      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_github_issue_closed_badge.description # failing because badge is missing

      page.should have_content "#{metric.default_unit} All-time"
      page.should have_content '2 badges'
    end
  end

end
