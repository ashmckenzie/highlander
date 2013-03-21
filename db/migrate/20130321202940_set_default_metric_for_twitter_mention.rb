class SetDefaultMetricForTwitterMention < ActiveRecord::Migration

  def up
    execute "update metrics set default_unit = 10 where name = 'twitter_mention';"
  end

  def down
    execute "update metrics set default_unit = 1 where name = 'twitter_mentionn';"
  end

end
