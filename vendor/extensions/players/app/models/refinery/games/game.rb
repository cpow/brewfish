module Refinery
  module Games
    class Game < Refinery::Core::BaseModel
      self.table_name = 'refinery_games'      
      belongs_to :season, :class_name => '::Refinery::Players::Season'
      acts_as_indexed :fields => [:opponent]
      attr_accessible :position, :date, :season_id, :opponent, :player_id
      has_many :players, :class_name => '::Refinery::Players::Player'

      validates :opponent, :presence => true, :uniqueness => true
    end
  end
end
