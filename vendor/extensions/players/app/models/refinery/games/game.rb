module Refinery
  module Games
    class Game < Refinery::Core::BaseModel
      self.table_name = 'refinery_games'      
      belongs_to :season, :class_name => '::Refinery::Players::Season'
      has_many :gamed_players, :class_name => '::Refinery::GamedPlayers::GamedPlayer'
      has_many :players, :through => :gamed_players, :class_name => '::Refinery::Players::Player'
      acts_as_indexed :fields => [:opponent]
      attr_accessible :position, :date, :season_id, :opponent, :player_id, :gamed_player_id

      validates :opponent, :presence => true

    end
  end
end
