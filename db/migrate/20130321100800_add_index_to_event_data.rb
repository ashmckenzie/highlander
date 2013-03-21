class AddIndexToEventData < ActiveRecord::Migration

  # http://schneems.com/post/19298469372/you-got-nosql-in-my-postgres-using-hstore-in-rails

  def up
    execute "CREATE INDEX events_gin_data ON events USING GIN(data)"
  end

  def down
    execute "DROP INDEX events_gin_data"
  end

end
