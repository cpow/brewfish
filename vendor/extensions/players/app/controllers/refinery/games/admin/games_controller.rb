module Refinery
  module Games
    module Admin
      class GamesController < ::Refinery::AdminController

        crudify :'refinery/games/game',
                :title_attribute => 'opponent', :xhr_paging => true

        def new
          if Refinery::Seasons::Season.all.count.eql?(0)
            flash[:error] = "Please create a season before you create any games"
            redirect_to refinery.seasons_admin_seasons_path
          end
          if Refinery::Players::Player.all.count.eql?(0)
            flash[:error] = "Please create players before you create any games"
            redirect_to refinery.players_admin_players_path
          end
          @game = Refinery::Games::Game.new
        end

        def create
          errors = []
          @game = Refinery::Games::Game.new(params[:game])
          errors << @game.errors.full_messages unless @game.valid?
          errors << Refinery::Players::Player.check_errors(params) unless Refinery::Players::Player.check_errors(params).blank?
          errors << Refinery::Stats::Stat.check_errors(params) unless Refinery::Stats::Stat.check_errors(params).blank?
          flash[:error] = errors.join("\n") unless errors.blank?
          return redirect_to refinery.new_games_admin_game_path unless errors.blank?

          @game.save
          params[:player].each_pair do |k,v|
            if v[:id]
              Refinery::GamedPlayers::GamedPlayer.create(player_id: v[:id].to_i, game_id: @game.id)
              Refinery::Stats::Stat.new_item(v[:stats], @game.id)
            end
          end
          redirect_to refinery.games_admin_games_path
        end
      end
    end
  end
end
