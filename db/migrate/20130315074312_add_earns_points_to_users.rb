class AddEarnsPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :earns_points, :boolean, default: true
  end
end
