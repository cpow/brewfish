module Refinery
  module Players
    class Player < Refinery::Core::BaseModel
      self.table_name = 'refinery_players'      
    
      acts_as_indexed :fields => [:bio, :name]

      validates :bio, :presence => true, :uniqueness => true
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
