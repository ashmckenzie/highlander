require 'spec_helper'

module PayloadAdapters

  describe Base do

    let(:github_push)       { Metric.build_stubbed(:github_push) }
    let(:jenkins_green_job) { Metric.build_stubbed(:jenkins_green_job) }
    let(:user)              { User.build_stubbed }

    let(:metric)  { github_push.name }
    let(:email)   { user.email }

    let(:payload) do
      { metric: metric, email: 'someone@example.com' }
    end

    subject { Base.new(payload) }

     describe '#to_event_hash' do

      let(:to_event_hash) { subject.to_event_hash }

      context 'when the metric is known' do

        it 'exposes the metric specified by the payload' do

        end
      end

      context 'when the metric is not known' do

        it 'is nil'
      end
    end

  end

end
