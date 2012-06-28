module Refinery
  module Games
    module Admin
      class GamesController < ::Refinery::AdminController

        crudify :'refinery/games/game',
                :title_attribute => 'opponent', :xhr_paging => true

        def create
          @game = Refinery::Games::Game.create!(params[:game])
          if params[:player]
            params[:player].each_pair do |k,v|
              Refinery::GamedPlayers::GamedPlayer.create!(player_id: v, game_id: @game.id)
            end
          end
        end
      end
    end
  end
end
