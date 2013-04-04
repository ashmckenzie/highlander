require 'spec_helper'

feature 'Twitter Mentions' do

  background do
    @first_time_badge     = FactoryGirl.create(:first_time)
    @one_twitter_mention  = FactoryGirl.create(:one_twitter_mention)
  end

  given(:user)                    { FactoryGirl.create(:twitter_user) }
  given(:twitter_mention_metric)  { FactoryGirl.create(:twitter_mention) }

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

  describe 'First @Hooroo mention' do

    background { page.driver.post '/api/twitter_mention.json', valid_params }

    scenario 'User is given First Time and One Twitter Mention badges' do

      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_twitter_mention.description

      page.should have_content "#{twitter_mention_metric.default_unit} Score"
      page.should have_content '2 Badges'
    end
  end

  describe 'Multiple @Hooroo mentions' do

    background { 3.times { page.driver.post '/api/twitter_mention.json', valid_params } }

    scenario 'User is given appropriate badges and points' do

      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_twitter_mention.description

      page.should have_content "#{twitter_mention_metric.default_unit * 3} Score"
      page.should have_content '2 Badges'
    end
  end

end
