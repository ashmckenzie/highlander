class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :user_services do |t|
      t.integer :user_id, null: false
      t.integer :service_id, null: false
      t.string :service_type, null: false

      t.timestamps
    end
  end
end
