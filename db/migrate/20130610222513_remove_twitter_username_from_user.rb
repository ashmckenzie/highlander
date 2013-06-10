class RemoveTwitterUsernameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :twitter_username
  end
end
