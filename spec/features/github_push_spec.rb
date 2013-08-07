require 'spec_helper'

feature 'Github Push' do

  given(:endpoint) { '/api/github_push.json' }

  background do
    @first_time_badge       = FactoryGirl.create(:first_time)
    @one_github_push_badge  = FactoryGirl.create(:one_github_push)
  end

  given!(:user)           { FactoryGirl.create(:user, :githubber) }
  given!(:github_service) { user.service_for(:github) }
  given!(:metric)         { FactoryGirl.create(:github_push) }

  given(:valid_params) do
    { payload: GithubPayloads.push(github_service.emails.first) }
  end

  describe 'First push' do

    background { page.driver.post endpoint, valid_params }

    scenario 'User is given the First Github push and First Timer badges' do
      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_github_push_badge.description

      page.should have_content "#{metric.default_unit} All-time"
      page.should have_content '2 badges'
    end
  end

  describe 'Second push' do

    background { 2.times { page.driver.post endpoint, valid_params } }

    scenario 'User has more points' do
      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_github_push_badge.description

      page.should have_content "#{metric.default_unit * 2} All-time"
      page.should have_content '2 badges'
    end
  end

end
