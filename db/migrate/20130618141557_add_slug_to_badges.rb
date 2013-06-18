class AddSlugToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :slug, :string

    add_index :badges, :slug, unique: true
  end
end
