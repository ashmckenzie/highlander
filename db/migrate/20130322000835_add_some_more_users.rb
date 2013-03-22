class AddSomeMoreUsers < ActiveRecord::Migration
  def up
    User.create(emails: ['michelle@hooroo.com'], twitter_username: 'PolyCopy', name: 'Michelle Legge', bio: 'Content and Social Manager for Aussie hotel booking site @Hooroo. Travel is everything')
  end

  def down
    # no down
  end
end
