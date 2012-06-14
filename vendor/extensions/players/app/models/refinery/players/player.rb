module Refinery
  module Players
    class Player < Refinery::Core::BaseModel
      self.table_name = 'refinery_players'      
      has_many :stats, :class_name => '::Refinery::Stats::Stat' 
      attr_accessible :bio, :photo_id, :position, :name
      acts_as_indexed :fields => [:bio, :name]

      validates :bio, :presence => true, :uniqueness => true
      belongs_to :photo, :class_name => '::Refinery::Image'

      def sum_stats(symbol)
        self.stats.to_a.sum(&symbol)
      end

      def batting_average
        hits = sum_stats(:singles) +
          sum_stats(:doubles) +
          sum_stats(:triples) +
          sum_stats(:home_runs)

        (hits.to_f/sum_stats(:at_bats).to_f).round(3)
      end
    end
  end
end
