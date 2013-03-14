class AddPreferredEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preferred_email, :string

    User.all.each do |user|
      user.update(preferred_email: user.emails[-1])
    end
  end
end
