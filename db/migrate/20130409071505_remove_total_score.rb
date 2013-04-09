class RemoveTotalScore < ActiveRecord::Migration
  def change
    remove_column :users, :total_score
  end
end
