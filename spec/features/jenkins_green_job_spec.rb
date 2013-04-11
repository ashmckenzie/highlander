require "spec_helper"

feature 'Jenkins Green Job' do

  given(:endpoint) { '/api/jenkins_green_job.json' }

  background do
    @first_time_badge                       = FactoryGirl.create(:first_time)
    @first_jenkins_green_job_badge          = FactoryGirl.create(:one_jenkins_green_job)
    @one_hundred_jenkins_green_jobs_badge   = FactoryGirl.create(:one_hundred_jenkins_green_jobs)
  end

  given(:user)    { FactoryGirl.create(:user) }
  given(:metric)  { FactoryGirl.create(:jenkins_green_job) }

  given(:params) do
    { metric: metric.name, email:  user.hooroo_email }
  end

  describe "First green job" do

    background { page.driver.post endpoint, params }

    scenario "User is given the First Github push and First Timer badges" do
      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @first_jenkins_green_job_badge.description

      page.should have_content "#{metric.default_unit} All-time Score"
      page.should have_content "2 Badges"
    end
  end

  describe "Second green job" do

    background { 2.times { page.driver.post endpoint, params } }

    scenario "User has more points" do
      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @first_jenkins_green_job_badge.description

      page.should have_content "#{metric.default_unit * 2} All-time Score"
      page.should have_content "2 Badges"
    end
  end

  describe "100 green jobs... OMG" do

    background { 100.times { page.driver.post endpoint, params } }

    scenario "User has 100 green jobs badge" do
      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @first_jenkins_green_job_badge.description
      page.should have_content @one_hundred_jenkins_green_jobs_badge.description

      page.should have_content "#{metric.default_unit * 100} All-time Score"
      page.should have_content "3 Badges"
    end
  end

end