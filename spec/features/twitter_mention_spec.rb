require "spec_helper"

feature "Twitter Mentions" do

  background do

    @first_time_badge = Badge.create(name: 'first_time', tag: 'Experience the quickening', description: 'First timer')
    @twitter_badge    = Badge.create(name: '1_twitter_mention', tag: 'Fly fly little birdie!', description: 'First Hooroo Twitter mention')

    c = Api::Adapters::TwitterController.new
    c.params = valid_params
    c.stub(:respond_to)
    c.create
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
    page.should have_content @twitter_badge.description
  end
end
