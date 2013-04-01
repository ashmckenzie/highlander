class AddDataMigrationSupport < ActiveRecord::Migration
  def change
    create_table :data_migrations, id: false do |t|
      t.string :version, null: false
    end

    add_index :data_migrations, :version, unique: true
  end
end
