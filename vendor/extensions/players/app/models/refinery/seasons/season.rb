module Refinery
  module Seasons
    class Season < Refinery::Core::BaseModel
      self.table_name = 'refinery_seasons'      
      has_many :games, :class_name => '::Refinery::Players::Game'
      attr_accessible :year, :position

      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      #
      def name
        self.year.year.to_s + " Season"
      end

      def title
        self.name
      end
    end
  end
end
