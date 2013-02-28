class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :metric_id
      t.integer :value, default: 1

      t.timestamps
    end
  end
end
