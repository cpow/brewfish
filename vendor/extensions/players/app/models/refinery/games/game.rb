module Refinery
  module Games
    class Game < Refinery::Core::BaseModel
      self.table_name = 'refinery_games'      
    
      acts_as_indexed :fields => [:opponent]

      validates :opponent, :presence => true, :uniqueness => true
              
    end
  end
end
