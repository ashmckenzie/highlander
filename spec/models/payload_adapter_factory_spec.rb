require 'spec_helper'

describe PayloadAdapterFactory do

  PUBLIC_INTERFACE_METHODS = %w{
    metric_name
    user
    validate!
  }

  # This is a duck-type test.
  # Maybe there's something built-in to rspec...
  Metric::NAMES.each do |metric|

    describe "factory for a payload for #{metric}" do
      subject { PayloadAdapterFactory.for({ metric: metric }) }

      PUBLIC_INTERFACE_METHODS.each do |message|
        it { should respond_to message.to_sym }
      end
    end

  end

end
