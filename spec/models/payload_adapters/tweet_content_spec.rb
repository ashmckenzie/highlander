require 'spec_helper'

describe PayloadAdapters::TweetContent do

  subject { described_class.new(tweet_content) }

  describe '#to_s' do

   let(:tweet_content) { 'This is a really important tweet' }

    it 'is the raw tweet content/text' do
      subject.to_s.should == tweet_content
    end
  end

  describe '#high_value?' do

    context 'when the tweet contains a link to hooroo.com' do
      let(:tweet_content) { 'Please visit hooroo.com, it is cool.' }

      it 'is true' do
        subject.high_value?.should be_true
      end
    end

    context 'when the tweet DOES NOT contain a link to hooroo.com' do
      let(:tweet_content) { 'Please visit hooroooo.com, it is cool.' }

      it 'is false' do
        subject.high_value?.should be_false
      end
    end

    context 'when the tweet contains a shortened link to hooroo.com' do
      let(:tweet_content) { 'Please visit goo.gl/W6tPN, it is cool. Or visit http://bit.ly/L5ePra' }

      it 'is true' do
        subject.high_value?.should be_true
      end
    end

  end

end
