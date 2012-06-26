require 'spec_helper'

module Refinery
  module GamedPlayers
    describe GamedPlayer do
      describe "validations" do
        subject do
          FactoryGirl.create(:gamed_player)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
