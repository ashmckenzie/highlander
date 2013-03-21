class AddTwitterUsernameToUsers < ActiveRecord::Migration
  def change
    unless column_exists? :users, :twitter_username
      add_column :users, :twitter_username, :string
    end
  end
end
