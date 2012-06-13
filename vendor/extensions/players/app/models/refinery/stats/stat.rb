module Refinery
  module Stats
    class Stat < Refinery::Core::BaseModel
      self.table_name = 'refinery_stats'      
      belongs_to :player, :class_name => '::Refinery::Players::Player'
      attr_accessible :player_id, :at_bats, :walks,
                      :singles, :doubles, :triples,
                      :home_runs, :position
    
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Stat_#{self.id}"
      end
              
    end
  end
end
