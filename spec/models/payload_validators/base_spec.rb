require 'spec_helper'

module PayloadValidators

  describe Base do

    let(:metric)    { double }
    let(:user)      { double }
    let(:payload)   { double(user: user, metric: metric) }

    let(:validator) { Base.new(payload) }

    describe '#validate!' do

      context 'when the user is not present' do
        let(:user) { nil }

        it 'raises an InvalidUserToken error' do
          expect{ validator.validate! }.to raise_error(InvalidUserToken)
        end
      end

      context 'when the metric is not present' do
        let(:metric) { nil }

        it 'raises an InvalidMetric error' do
          expect{ validator.validate! }.to raise_error(InvalidMetric)
        end
      end
    end

  end

end
