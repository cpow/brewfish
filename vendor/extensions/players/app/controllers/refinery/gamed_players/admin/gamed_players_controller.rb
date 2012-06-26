module Refinery
  module GamedPlayers
    module Admin
      class GamedPlayersController < ::Refinery::AdminController

        crudify :'refinery/gamed_players/gamed_player', :xhr_paging => true

      end
    end
  end
end
