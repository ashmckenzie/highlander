class CreateGithubService < ActiveRecord::Migration
  def change
    create_table :github_services do |t|
      t.string :username, null: false
      t.string :emails, array: true, default: '{}'

      t.timestamps
    end
  end
end
