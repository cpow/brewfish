require 'spec_helper'

module Refinery
  module Seasons
    describe Season do
      describe "validations" do
        subject do
          FactoryGirl.create(:season)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
