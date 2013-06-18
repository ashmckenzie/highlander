require 'rss'

NullAtomFeed = Naught.build do |config|
  config.mimic RSS::Atom::Feed

  def entries
    []
  end

end
