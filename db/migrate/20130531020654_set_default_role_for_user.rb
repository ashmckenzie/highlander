class SetDefaultRoleForUser < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => 'user'
  end
end
