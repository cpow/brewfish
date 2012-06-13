module Refinery
  module Players
    class Player < Refinery::Core::BaseModel
      self.table_name = 'refinery_players'      
      has_many :stats, :class_name => '::Refinery::Stats::Stat' 
    
      acts_as_indexed :fields => [:bio, :name]

      validates :bio, :presence => true, :uniqueness => true
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
