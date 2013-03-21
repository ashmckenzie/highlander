class AddMoreTwitterUsernamesToUsers < ActiveRecord::Migration
  def change
    {
      'ash@hooroo.com' => 'ashmckenzie',
      'stuart@hooroo.com' => 'stuliston',
      'daniel@hooroo.com' => 'unroundme',

    }.each do |email, twitter_username|
      add_twitter_username_for(email, twitter_username)
    end
  end

  private

  def add_twitter_username_for email, twitter_username
    User.with_email(email).update(twitter_username: twitter_username)
  end
end
