module Refinery
  module Players
    class PlayersController < ::ApplicationController

      before_filter :find_all_players
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @player in the line below:
        present(@page)
      end

      def show
        @player = Player.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @player in the line below:
        present(@page)
      end

    protected

      def find_all_players
        @players = Player.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/players").first
      end

    end
  end
end
