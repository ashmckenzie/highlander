class AddLeaderboarderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :leaderboarder, :boolean, default: true
  end
end
