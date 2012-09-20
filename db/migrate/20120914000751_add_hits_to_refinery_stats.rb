class AddHitsToRefineryStats < ActiveRecord::Migration
  def change
    add_column :refinery_stats, :hits, :integer
  end
end
