class AddGameIdToRefineryStats < ActiveRecord::Migration
  def change
    add_column :refinery_stats, :game_id, :integer
  end
end
