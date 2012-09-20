class AddRunsToRefineryStats < ActiveRecord::Migration
  def change
    add_column :refinery_stats, :runs, :integer
  end
end
