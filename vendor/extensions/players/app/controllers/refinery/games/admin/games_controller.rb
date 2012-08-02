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
          @game = @game.nil? ? Refinery::Games::Game.new : @game
          @players = @players.blank? ? Refinery::Players::Player.all : @players
        end

        def create
          errors = []
          session[:players] = nil
          session[:game] = nil
          @game = Refinery::Games::Game.new(params[:game])
          @game.valid?
          errors << Refinery::Players::Player.check_errors(params) unless Refinery::Players::Player.check_errors(params).blank?
          errors << Refinery::Stats::Stat.check_errors(params) unless Refinery::Stats::Stat.check_errors(params).blank?
          unless errors.blank?
            @players = Refinery::Players::Player.add_stats(params)
            flash[:error] = errors.join("\n") 
            return render :action => 'new'
          end

          @game.save
          params[:player].each_pair do |k,v|
            if v[:id]
              Refinery::GamedPlayers::GamedPlayer.create(player_id: v[:id].to_i, game_id: @game.id)
              Refinery::Stats::Stat.new_item(v[:stats], @game.id).save!
            end
          end
          redirect_to refinery.games_admin_games_path
        end
      end
    end
  end
end
