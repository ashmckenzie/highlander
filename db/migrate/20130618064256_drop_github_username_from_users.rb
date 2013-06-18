class DropGithubUsernameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :github_username
  end
end
