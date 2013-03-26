require "spec_helper"

feature "Twitter Mentions" do

  background do

    @first_time_badge     = FactoryGirl.create(:first_time)
    @one_twitter_mention  = FactoryGirl.create(:one_twitter_mention)

    page.driver.post api_adapters_twitter_index_path, valid_params
  end

  given(:valid_params) do
    {
      twitter:
        {
          tweet_id:         12386560386060,
          text:             'I just mentioned @Hooroo in a tweet! #YOLO',
          twitter_username: user.twitter_username,
          followers_count:  155,
          metric:           twitter_mention_metric.name,
          arbitrary_data:   42
        }
    }
  end

  given(:user)                    { FactoryGirl.create(:twitter_user) }
  given(:twitter_mention_metric)  { FactoryGirl.create(:twitter_mention) }

  scenario "User twets mentioning @Hooroo" do
    visit user_path(user)
    page.should have_content @first_time_badge.description
    page.should have_content @one_twitter_mention.description
  end
end
