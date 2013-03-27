require 'spec_helper'

module PayloadAdapters

  describe Basic do

    let(:payload) do
      { metric: 'some_metric', email: 'someone@example.com' }
    end

    subject { Basic.new(payload) }
    before  { subject.stub(valid_metric_names: ['some_metric']) }

    its(:metric)  { should == payload[:metric] }
    its(:email)   { should == payload[:email] }

    describe '#valid?' do

      context 'when all data is present' do
        its(:valid?) { should be_true }
      end

      context 'when the email is missing' do
        subject { Basic.new(payload.merge({ email: nil })) }
        its(:valid?) { should be_false }
      end

      context 'when the metric is missing' do
        subject { Basic.new(payload.merge({ metric: nil })) }
        its(:valid?) { should be_false }
      end

      context 'when the metric is not in the known list' do
        subject { Basic.new(payload.merge({ metric: 'made_up' })) }
        its(:valid?) { should be_false }
      end

    end

  end

end
