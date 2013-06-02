class AddSlugToBounties < ActiveRecord::Migration
  def change
    unless column_exists? :bounties, :slug
      add_column :bounties, :slug, :string
    end

    add_index :bounties, :slug, unique: true
  end
end
