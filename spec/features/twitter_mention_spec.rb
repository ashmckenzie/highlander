require 'spec_helper'

feature 'Twitter Mentions' do

  given(:endpoint) { '/api/twitter_mention.json' }

  background do
    @one_twitter_mention  = FactoryGirl.create(:one_twitter_mention)
  end

  given(:user)                    { FactoryGirl.create(:user, :tweeter) }
  given!(:twitter_service)        { user.service_for(:twitter) }
  given(:twitter_mention_metric)  { FactoryGirl.create(:twitter_mention) }

  given(:valid_params) do
    {
      metric:           twitter_mention_metric.name,
      tweet_id:         860860860,
      text:             'I just mentioned @Hooroo in a tweet! #YOLO',
      twitter_username: twitter_service.username,
      followers_count:  155
    }
  end

  describe 'First @Hooroo mention' do

    background { page.driver.post endpoint, valid_params }

    scenario 'User is given First Time and One Twitter Mention badge' do

      visit user_path(user)
      page.should have_content @one_twitter_mention.description

      page.should have_content "#{twitter_mention_metric.default_unit} All-time"
      page.should have_content '2 badges'
    end
  end

  describe 'Multiple @Hooroo mentions' do

    background do
      page.driver.post endpoint, valid_params.merge(tweet_id: 1)
      page.driver.post endpoint, valid_params.merge(tweet_id: 2)
      page.driver.post endpoint, valid_params.merge(tweet_id: 3)
    end

    scenario 'User is given appropriate badges and points' do

      visit user_path(user)
      page.should have_content @one_twitter_mention.description

      page.should have_content "#{twitter_mention_metric.default_unit * 3} All-time"
      page.should have_content '2 badges'
    end
  end

  describe 'Ensuring the same Tweet isnt pointed twice' do

    background do
      page.driver.post endpoint, valid_params.merge(tweet_id: 1)
      page.driver.post endpoint, valid_params.merge(tweet_id: 2)
      page.driver.post endpoint, valid_params.merge(tweet_id: 1)
    end

    scenario 'User only given points for original tweets' do

      visit user_path(user)
      page.should have_content @one_twitter_mention.description

      page.should have_content "#{twitter_mention_metric.default_unit * 2} All-time"
      page.should have_content '2 badges'
    end
  end

end
