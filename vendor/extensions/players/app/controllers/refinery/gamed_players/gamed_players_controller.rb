module Refinery
  module GamedPlayers
    class GamedPlayersController < ::ApplicationController

      before_filter :find_all_gamed_players
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gamed_player in the line below:
        present(@page)
      end

      def show
        @gamed_player = GamedPlayer.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gamed_player in the line below:
        present(@page)
      end

    protected

      def find_all_gamed_players
        @gamed_players = GamedPlayer.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/gamed_players").first
      end

    end
  end
end
