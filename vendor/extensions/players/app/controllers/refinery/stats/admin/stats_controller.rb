module Refinery
  module Stats
    module Admin
      class StatsController < ::Refinery::AdminController

        crudify :'refinery/stats/stat', :xhr_paging => true

      end
    end
  end
end
