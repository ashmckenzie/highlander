class CreateSlugs < ActiveRecord::Migration
  def change
    User.unscoped.find_each(&:save)
  end
end
