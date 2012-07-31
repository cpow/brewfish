module Refinery
  module Games
    module GameHelper
      def flash_div
        if flash[:notice].nil? || flash[:notice].empty?
          ""
        else
          return "<div class='error'> #{flash_items} </div>"
        end
      end

      def flash_items
        if flash[:notice].is_a?(Array)
          return flash[:notice].join('<br/>')
        else
          return flash[:notice]
        end
      end
    end
  end
end