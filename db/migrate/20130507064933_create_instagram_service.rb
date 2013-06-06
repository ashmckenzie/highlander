class CreateInstagramService < ActiveRecord::Migration
  def change
    create_table :instagram_services do |t|
      t.string :username, null: false

      t.timestamps
    end
  end
end
