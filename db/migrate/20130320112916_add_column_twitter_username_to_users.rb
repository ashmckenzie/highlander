class AddColumnTwitterUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_username, :string

    if Metric.where(name: 'twitter_mention').empty?
      Metric.create(name: 'twitter_mention', description: 'Twitter mention')
    end

    User.with_email('ash@hooroo.com').update_attribute(:twitter_username, 'ashmckenzie')
    User.with_email('daniel@hooroo.com').update_attribute(:twitter_username, 'unroundme')
    User.with_email('stuart.liston@gmail.com').update_attribute(:twitter_username, 'stuliston')
  end
end
