class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :string, limit: 128
  end
end
