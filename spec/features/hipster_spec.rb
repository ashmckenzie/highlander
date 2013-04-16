require 'spec_helper'

feature 'Hipster Badge' do

  given(:endpoint) { '/api/jenkins_green_job.json' }

  background do
    @first_time_badge               = FactoryGirl.create(:first_time)
    @hipster_badge                  = FactoryGirl.create(:badge, :hipster)
    @first_jenkins_green_job_badge  = FactoryGirl.create(:one_jenkins_green_job)
  end

  given(:user)    { FactoryGirl.create(:user) }
  given(:metric)  { FactoryGirl.create(:jenkins_green_job) }

  given(:params) do
    { metric: metric.name, email:  user.hooroo_email }
  end

  describe "First green job - when no other users have that badge yet" do

    background { page.driver.post endpoint, params }

    scenario "User is given the First Github push, First-time and Hipster badges" do
      visit user_path(user)
      page.should have_content '4 Badges'
      page.should have_content @first_jenkins_green_job_badge.description
      page.should have_content @hipster_badge.description
      page.should have_content "#{metric.default_unit} All-time"
      page.should have_content "You got the #{@first_time_badge.description} badge before it was cool"
      page.should have_content "You got the #{@first_jenkins_green_job_badge.description} badge before it was cool"
    end
  end

end
