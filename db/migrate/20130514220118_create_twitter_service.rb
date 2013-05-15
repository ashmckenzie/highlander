class CreateTwitterService < ActiveRecord::Migration
  def change
    create_table :twitter_services do |t|
      t.string :username, null: false

      t.timestamps
    end
  end
end
