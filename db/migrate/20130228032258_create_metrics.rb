class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :name
      t.string :description
      t.integer :default_unit, default: 1

      t.timestamps
    end
  end
end
