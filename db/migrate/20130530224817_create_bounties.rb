class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :reward, default: 5
      t.integer :created_by_id, null: false
      t.integer :claimed_by_id, null: true
      t.datetime :needs_claiming_by, null: true
      t.datetime :claimed_at, null: true

      t.timestamps
    end
  end
end
