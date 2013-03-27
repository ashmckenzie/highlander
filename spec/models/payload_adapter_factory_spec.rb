require 'spec_helper'

describe PayloadAdapterFactory do

  adapter_messages = %w{
      metric
      email
      valid?
    }

  # This is a duck-type test.
  # Maybe there's something built-in to rspec...
  Metric::NAMES.each do |metric|

    describe "factory for #{metric}" do
      subject { PayloadAdapterFactory.for(metric) }

      adapter_messages.each do |message|
        it { should respond_to message.to_sym }
      end
    end

  end

end