class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :slug
      t.string  :email
      t.integer :total_score, default: 0
      t.string  :emails, array: true, default: '{}'
      t.string  :bio, limit: 128
      t.string  :preferred_email
      t.boolean :enabled, default: true
      t.boolean :earns_points, default: true
      t.string  :twitter_username

      t.timestamps
    end
  end
end
