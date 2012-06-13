class AddPlayerIdToRefineryStats < ActiveRecord::Migration
  def change
    add_column :refinery_stats, :player_id, :integer
  end
end
