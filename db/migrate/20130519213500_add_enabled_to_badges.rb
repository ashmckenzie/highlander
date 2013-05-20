class AddEnabledToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :enabled, :boolean, default: true
  end
end
