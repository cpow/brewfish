module Refinery
  module Stats
    class StatsController < ::ApplicationController

      before_filter :find_all_stats
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @stat in the line below:
        present(@page)
      end

      def show
        @stat = Stat.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @stat in the line below:
        present(@page)
      end

    protected

      def find_all_stats
        @stats = Stat.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/stats").first
      end

    end
  end
end
