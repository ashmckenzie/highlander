class AddTagToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :tag, :string
  end
end
