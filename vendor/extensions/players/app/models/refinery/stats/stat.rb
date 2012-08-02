module Refinery
  module Stats
    class Stat < Refinery::Core::BaseModel
      self.table_name = 'refinery_stats'      
      belongs_to :player, :class_name => '::Refinery::Players::Player'
      belongs_to :game, :class_name => '::Refinery::Games::Game'
      attr_accessible :player_id, :game_id, :at_bats, :walks,
                      :singles, :doubles, :triples,
                      :home_runs, :position
      validates :at_bats, :walks, :singles, :doubles, :triples, :home_runs, :presence => true, :if => :player_id
    
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Stat_#{self.id}"
      end

      def self.new_item(stat_hash, game_id=1)
        Refinery::Stats::Stat.new(
          player_id: stat_hash[:player_id],
          game_id: game_id,
          at_bats: stat_hash[:at_bats],
          walks: stat_hash[:walks],
          singles: stat_hash[:singles],
          doubles: stat_hash[:doubles],
          triples: stat_hash[:triples],
          home_runs: stat_hash[:home_runs])
      end

      def self.check_errors(params_hash)
        errors_hash = []
        params_hash[:player].each_pair do |k,v|
          stat = Refinery::Stats::Stat.new(v[:stats]) if v[:id]
          unless stat.nil?
            unless stat.valid?
              errors_hash << stat.errors.full_messages
              return errors_hash
            end
          end
        end
        return ""
      end
    end
  end
end
