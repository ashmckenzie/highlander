class AddEmailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :emails, :string, array: true, default: '{}'

    User.all.each do |user|
      user.update_attribute(:emails, [ user.email ])
    end

    remove_column :users, :email
  end
end
