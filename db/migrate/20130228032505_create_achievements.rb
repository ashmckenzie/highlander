class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :user_id
      t.integer :badge_id

      t.timestamps
    end
  end
end
