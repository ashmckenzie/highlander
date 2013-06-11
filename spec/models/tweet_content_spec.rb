require 'spec_helper'

describe TweetContent do

  describe '#to_s' do

    it 'is the raw tweet content/text' do
      tweet_content = 'This is a really important tweet'
      TweetContent.new(tweet_content).to_s.should == tweet_content
    end
  end

  describe '#high_value?' do

    context 'when the tweet contains a link to hooroo.com' do
      let(:tweet_content) { 'Please visit hooroo.com, it is cool.' }

      it 'is true' do
        TweetContent.new(tweet_content).high_value?.should be_true
      end
    end

    context 'when the tweet DOES NOT contain a link to hooroo.com' do
      let(:tweet_content) { 'Please visit hooroooo.com, it is cool.' }

      it 'is false' do
        TweetContent.new(tweet_content).high_value?.should be_false
      end
    end

    context 'when the tweet contains a shortened link to hooroo.com' do
      let(:tweet_content) { 'Please visit goo.gl/W6tPN, it is cool. Or visit http://bit.ly/L5ePra' }

      it 'is true' do
        TweetContent.new(tweet_content).high_value?.should be_true
      end
    end

  end

end
