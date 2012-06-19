require 'spec_helper'

module Refinery
  module Games
    describe Game do
      describe "validations" do
        subject do
          FactoryGirl.create(:game,
          :opponent => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:opponent) { should == "Refinery CMS" }
      end
    end
  end
end
