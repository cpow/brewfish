class AddGameIdToRefineryPlayers < ActiveRecord::Migration
  def change
    add_column :refinery_players, :game_id, :integer
  end
end
