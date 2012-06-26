module Refinery
  module GamedPlayers
    class GamedPlayer < Refinery::Core::BaseModel
      self.table_name = 'refinery_gamed_players'      
      attr_accessible :player_id, :game_id
      belongs_to :player
      belongs_to :game
    
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/gamed_players/app/models/refinery/gamed_players/gamed_player.rb"
      end
              
    end
  end
end
