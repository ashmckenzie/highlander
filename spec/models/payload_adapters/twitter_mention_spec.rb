require 'spec_helper'

module PayloadAdapters

  describe TwitterMention do

    describe '#tweet_id' do

      it 'is the tweet id from the payload' do
        TwitterMention.new({ tweet_id: 123 }).tweet_id.should == 123
      end
    end

    describe '#twitter_username' do

      it 'is the username from the payload' do
        TwitterMention.new({ twitter_username: 'stuliston' }).twitter_username.should == 'stuliston'
      end
    end

    describe '#text' do

      let(:text) { 'This is a cool tweet, yo!' }

      it 'is the text from the payload' do
        TwitterMention.new({ text: text }).text.should == text
      end
    end

  end

end
