require 'spec_helper'

module Jschematic
  module Attributes
    describe Minimum do
      subject { Minimum.new(2112) }

      it { should accept("portokalli") }
    end

    describe Maximum do
      subject { Maximum.new(2112) }
      
      it { should accept("portokalli") }
    end

    describe ExclusiveMinimum do
      subject { ExclusiveMinimum }

      it "raises if minimum is not defined" do
        expect { subject.new(true){|needed| nil} }.to raise_error(/'exclusiveMinimum' depends on 'minimum'/)
      end
    end

    describe ExclusiveMaximum do
      subject { ExclusiveMaximum }

      it "raises if maximum is not defined" do
        expect { subject.new(true){|needed| nil} }.to raise_error(/'exclusiveMaximum' depends on 'maximum'/)
      end
    end
  end
end
