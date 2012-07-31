module Refinery
  module Players
    class Player < Refinery::Core::BaseModel
      self.table_name = 'refinery_players'
      has_many :stats, :class_name => '::Refinery::Stats::Stat'
      has_many :gamed_players, :class_name => '::Refinery::GamedPlayers::GamedPlayer'
      has_many :games, :through => :gamed_players, :class_name => '::Refinery::Games::Game', :foreign_key => :game_id

      belongs_to :photo, :class_name => '::Refinery::Image'

      attr_accessible :bio, :photo_id, :position, :name, :gamed_player_id
      acts_as_indexed :fields => [:bio, :name]

      validates :bio, :presence => true, :uniqueness => true

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

      def self.check_errors(params_hash)
        errors_array = []
        player_ids = []
        params_hash[:player].each_pair do |k,v|
          player_ids << "true" if v[:id]
        end
        if player_ids.blank?
          errors_array << "Please add players" 
          return errors_array
        end
        return nil
      end
    end
  end
end
