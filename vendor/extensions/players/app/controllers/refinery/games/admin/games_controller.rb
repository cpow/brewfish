module Refinery
  module Games
    module Admin
      class GamesController < ::Refinery::AdminController

        crudify :'refinery/games/game',
                :title_attribute => 'opponent', :xhr_paging => true

      end
    end
  end
end
