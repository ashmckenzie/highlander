class AddPositionToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :position, :integer, default: 0
  end
end
