module Refinery
  module Players
    module Admin
      class PlayersController < ::Refinery::AdminController

        crudify :'refinery/players/player',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
