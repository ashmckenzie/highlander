class SetDefaultRoleForUser < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, :default => 'guest'
  end

  def down
    change_column :users, :role, :string, :default => nil
  end
end
