require 'spec_helper'

feature 'Hipster badge' do

  given(:endpoint) { '/api/jenkins_green_job.json' }

  background do
    @hipster_badge            = FactoryGirl.create(:badge, :hipster)
    @first_github_push_badge  = FactoryGirl.create(:one_github_push)
    binding.pry
  end

  given(:user)    { FactoryGirl.create(:user) }
  given!(:metric) { FactoryGirl.create(:github_push) }
  given(:params)  { { email:  user.hooroo_email } }

  describe "First Github Push - when no other users have this badge" do

    background { page.driver.post endpoint, params }

    scenario "User is given the First Github Push Badge and Hipster Badge" do
      visit user_path(user)
      page.should have_content @first_github_push_badge.description
      page.should have_content @hipster_badge.description
      page.should have_content "You got the #{@first_github_push_badge.description} badge before it was cool"
    end
  end

end