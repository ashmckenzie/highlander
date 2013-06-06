class AddAvatarEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_email, :string
  end
end
