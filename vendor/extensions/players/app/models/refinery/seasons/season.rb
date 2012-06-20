module Refinery
  module Seasons
    class Season < Refinery::Core::BaseModel
      self.table_name = 'refinery_seasons'      
      has_many :games, :class_name => '::Refinery::Players::Game'
      attr_accessible :year

      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/seasons/app/models/refinery/seasons/season.rb"
      end
    end
  end
end
