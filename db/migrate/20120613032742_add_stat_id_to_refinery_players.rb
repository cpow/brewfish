class AddStatIdToRefineryPlayers < ActiveRecord::Migration
  def change
    add_column :refinery_players, :stat_id, :integer
  end
end
