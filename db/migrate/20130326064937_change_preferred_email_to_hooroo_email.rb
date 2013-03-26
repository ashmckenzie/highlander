class ChangePreferredEmailToHoorooEmail < ActiveRecord::Migration
  def change
    rename_column :users, :hooroo_email, :hooroo_email
  end
end
