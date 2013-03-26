require "spec_helper"

feature "First Github push" do

  background do

    @first_time_badge   = Badge.create(name: 'first_time', tag: 'Experience the quickening', description: 'First timer')
    @github_push_badge  = Badge.create(name: '1_github_push', tag: 'Octocat is pleased with you', description: 'First GitHub push')

    c = Api::Adapters::GithubController.new
    c.params = valid_params
    c.stub(:respond_to)
    c.create
  end

  given(:valid_params) do
    {
      metric:   metric.name,
      email:    user.email,
      payload:  GithubPush.new.payload
    }
  end

  given(:user)    { FactoryGirl.create(:user) }
  given(:metric)  { FactoryGirl.create(:github_push) }

  scenario "User is given the First Github push and First Timer badges" do
    visit user_path(user)
    page.should have_content @first_time_badge.description
    page.should have_content @github_push_badge.description
  end
end