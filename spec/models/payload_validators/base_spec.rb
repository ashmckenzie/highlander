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

        it 'raises an UserNotFound error' do
          expect{ validator.validate! }.to raise_error(Errors::UserNotFound)
        end
      end

      context 'when the user is not a point earner' do

        before do
          user.stub(:earns_points?).and_return(false)
        end

        it 'raises an UserNotPointEarner error' do
          expect{ validator.validate! }.to raise_error(Errors::UserNotPointEarner)
        end
      end

      context 'when the metric is not present' do
        let(:metric) { nil }

        it 'raises an InvalidMetric error' do
          expect{ validator.validate! }.to raise_error(Errors::InvalidMetric)
        end
      end
    end

  end

end
