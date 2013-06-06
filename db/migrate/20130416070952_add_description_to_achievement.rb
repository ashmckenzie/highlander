class AddDescriptionToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :description, :string
  end
end
