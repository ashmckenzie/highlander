class AddRelatedMetricToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :related_metric, :string
  end
end
