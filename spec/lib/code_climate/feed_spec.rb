require 'spec_helper'

module CodeClimate

  describe Feed do

    let(:rss_feed)  { File.open('spec/fixtures/code_climate_feed.atom').read }
    let(:scraper)   { double(scrape: rss_feed) }
    let(:from_date) { DateTime.parse('2013-05-30') }
    let(:feed)      { Feed.new(scraper, from_date) }

    describe '#update!' do

      it 'grabs the latest RSS feed' do
        feed.entries.should be_empty
        feed.update!
        feed.entries.should_not be_empty
      end

    end

    describe '#entries' do

      it 'returns the rss entries from the given date' do
        feed.update!
        recent_entries_count = feed.entries.count

        old_feed = Feed.new(scraper, DateTime.parse('2013-01-01'))
        old_feed.update!

        old_feed.entries.count.should be > recent_entries_count
      end
    end

    describe '#improvements' do

      let(:from_date) { DateTime.parse('2013-01-01') }

      it 'filters entries to improvements only' do
        feed.update!
        improvements = feed.improvements
        improvements.count.should be < feed.entries.count
        improvements.each { |i| i.should be_improvement }
      end
    end

  end

end
