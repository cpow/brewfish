module Refinery
  module Seasons
    module Admin
      class SeasonsController < ::Refinery::AdminController

        crudify :'refinery/seasons/season', :xhr_paging => true

      end
    end
  end
end
