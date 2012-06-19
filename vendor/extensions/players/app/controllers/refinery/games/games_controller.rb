module Refinery
  module Games
    class GamesController < ::ApplicationController

      before_filter :find_all_games
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @game in the line below:
        present(@page)
      end

      def show
        @game = Game.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @game in the line below:
        present(@page)
      end

    protected

      def find_all_games
        @games = Game.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/games").first
      end

    end
  end
end
