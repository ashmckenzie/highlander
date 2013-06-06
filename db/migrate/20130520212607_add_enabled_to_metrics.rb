class AddEnabledToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :enabled, :boolean, default: true
  end
end
