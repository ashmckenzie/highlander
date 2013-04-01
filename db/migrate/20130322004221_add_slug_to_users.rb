class AddSlugToUsers < ActiveRecord::Migration
  def change
    unless column_exists? :users, :slug
      add_column :users, :slug, :string
    end

    add_index :users, :slug, unique: true
  end
end
