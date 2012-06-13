module Refinery
  module Stats
    class Stat < Refinery::Core::BaseModel
      self.table_name = 'refinery_stats'      
    
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/stats/app/models/refinery/stats/stat.rb"
      end
              
    end
  end
end
