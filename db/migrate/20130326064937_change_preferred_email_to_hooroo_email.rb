class ChangePreferredEmailToHoorooEmail < ActiveRecord::Migration
  def change
    rename_column :users, :preferred_email, :hooroo_email
  end
end
