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
              Refinery::GamedPlayers::GamedPlayer.create!(player_id: v[:id].to_i, game_id: @game.id)
              Refinery::Stats::Stat.new_item(v[:stats], @game.id)
            end
          end
          redirect_to refinery.games_admin_games_path
        end
      end
    end
  end
end
