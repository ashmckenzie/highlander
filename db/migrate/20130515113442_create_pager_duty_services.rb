class CreatePagerDutyServices < ActiveRecord::Migration
  def change
    create_table :pager_duty_services do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
