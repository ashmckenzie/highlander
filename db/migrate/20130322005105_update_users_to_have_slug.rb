class UpdateUsersToHaveSlug < ActiveRecord::Migration
  def change
    User.all.each { |u| u.save! }
  end
end
