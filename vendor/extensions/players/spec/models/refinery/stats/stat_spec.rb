require 'spec_helper'

module Refinery
  module Stats
    describe Stat do
      describe "validations" do
        subject do
          FactoryGirl.create(:stat)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
