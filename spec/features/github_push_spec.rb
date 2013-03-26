require "spec_helper"

feature "First Github push" do

  background do

    @first_time_badge       = FactoryGirl.create(:first_time)
    @one_github_push_badge  = FactoryGirl.create(:one_github_push)

    page.driver.post api_adapters_github_index_path, valid_params
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
    page.should have_content @one_github_push_badge.description
  end
end
