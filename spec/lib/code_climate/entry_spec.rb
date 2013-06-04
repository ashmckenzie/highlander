require 'spec_helper'
require 'rss'

module CodeClimate

  describe Entry do

    subject { Entry.new(RSS::Parser.parse(rss_entry, false)) }

    context 'when the entry is a RatingChange where the class DECLINED in quality' do

      let(:rss_entry) do
        <<-rss
          <entry>
            <id>tag:codeclimate.com,2005:Events::RatingChanged/51a82d49f3ea004e2f000004</id>
            <published>2013-05-31T04:54:51Z</published>
            <updated>2013-05-31T04:55:37Z</updated>
            <link rel="alternate" type="text/html" href="https://codeclimate.com/repos/51233ac356b10216a600183f/Consumer::BookingsController?from_sha=21006fdd&amp;to_sha=e4f0b8ea"/>
            <title>Consumer::BookingsController has declined from a B to a C.</title>
          </entry>
        rss
      end

      its(:id)           { should == 'tag:codeclimate.com,2005:Events::RatingChanged/51a82d49f3ea004e2f000004' }
      its(:title)        { should == 'Consumer::BookingsController has declined from a B to a C.' }
      its(:type)         { should == :rating_changed }
      its(:improvement?) { should be_false }

    end

    context 'when the entry is a RatingChange where the class IMPROVED in quality' do

      let(:rss_entry) do
        <<-rss
          <entry>
            <id>tag:codeclimate.com,2005:Events::RatingChanged/514bc1ecc7f3a303b3000004</id>
            <published>2013-03-22T02:27:54Z</published>
            <updated>2013-03-22T02:29:00Z</updated>
            <link rel="alternate" type="text/html" href="https://codeclimate.com/repos/51233ac356b10216a600183f/Consumer::SearchController?from_sha=76b54d2a&amp;to_sha=4e5deb88"/>
            <title>Consumer::SearchController has improved from a C to a A.</title>
          </entry>
        rss
      end

      its(:id)           { should == 'tag:codeclimate.com,2005:Events::RatingChanged/514bc1ecc7f3a303b3000004' }
      its(:title)        { should == 'Consumer::SearchController has improved from a C to a A.' }
      its(:type)         { should == :rating_changed }
      its(:improvement?) { should be_true }

    end

    context 'when the entry is a ConstantsCreated' do

      let(:rss_entry) do
        <<-rss
          <entry>
            <id>tag:codeclimate.com,2005:Events::ConstantsCreated/51a813b5f3ea0070fb000005</id>
            <published>2013-05-31T03:05:13Z</published>
            <updated>2013-05-31T03:06:29Z</updated>
            <link rel="alternate" type="text/html" href="https://codeclimate.com/repos/51233ac356b10216a600183f/constants"/>
            <title>Four classes/modules were added.</title>
            <content type="xhtml">
              <div xmlns="http://www.w3.org/1999/xhtml">
                <![CDATA[<ul>&lt;li&gt;&lt;strong&gt;A&lt;/strong&gt;: &lt;a href=&quot;https://codeclimate.com/repos/51233ac356b10216a600183f/Grid&quot;&gt;Grid&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;A&lt;/strong&gt;: &lt;a href=&quot;https://codeclimate.com/repos/51233ac356b10216a600183f/GridRow&quot;&gt;GridRow&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;A&lt;/strong&gt;: &lt;a href=&quot;https://codeclimate.com/repos/51233ac356b10216a600183f/LowestCostOffers&quot;&gt;LowestCostOffers&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;A&lt;/strong&gt;: &lt;a href=&quot;https://codeclimate.com/repos/51233ac356b10216a600183f/Searches::Locals::OfferGrid&quot;&gt;Searches::Locals::OfferGrid&lt;/a&gt;&lt;/li&gt;</ul>]]>
              </div>
            </content>
          </entry>
        rss
      end

      its(:id)           { should == 'tag:codeclimate.com,2005:Events::ConstantsCreated/51a813b5f3ea0070fb000005' }
      its(:title)        { should == 'Four classes/modules were added.' }
      its(:type)         { should == :constants_created }
      its(:improvement?) { should be_false }

    end

    context 'when the entry is a WeeklyStats' do

      let(:rss_entry) do
        <<-rss
          <entry>
            <id>tag:codeclimate.com,2005:Events::WeeklyStats/51a3308cf3ea006ad4000002</id>
            <published>2013-05-27T00:00:00Z</published>
            <updated>2013-05-27T10:08:12Z</updated>
            <link rel="alternate" type="text/html" href="https://codeclimate.com/repos/51233ac356b10216a600183f/feed"/>
            <title>Summary of May 20th - 26th</title>
            <content type="xhtml">
              <div xmlns="http://www.w3.org/1999/xhtml">
                <![CDATA[<p>220 files changed, 4046 insertions, 2545 deletions</p>]]>
              </div>
            </content>
          </entry>
        rss
      end

      its(:id)           { should == 'tag:codeclimate.com,2005:Events::WeeklyStats/51a3308cf3ea006ad4000002' }
      its(:title)        { should == 'Summary of May 20th - 26th' }
      its(:type)         { should == :weekly_stats }
      its(:improvement?) { should be_false }

    end

    describe '#from_sha and #to_sha' do

      let(:rss_entry) do
        <<-rss
          <entry>
            <id>tag:codeclimate.com,2005:Events::RatingChanged/51a82d49f3ea004e2f000004</id>
            <published>2013-05-31T04:54:51Z</published>
            <updated>2013-05-31T04:55:37Z</updated>
            <link rel="alternate" type="text/html" href="https://codeclimate.com/repos/51233ac356b10216a600183f/Consumer::BookingsController?from_sha=21006fdd&amp;to_sha=e4f0b8ea"/>
            <title>Consumer::BookingsController has declined from a B to a C.</title>
          </entry>
        rss
      end

      its(:from_sha) { should == '21006fdd' }
      its(:to_sha)   { should == 'e4f0b8ea' }
    end

  end

end
