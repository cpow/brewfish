class AddGamedPlayerIdToRefineryPlayers < ActiveRecord::Migration
  def change
    add_column :refinery_players, :gamed_player_id, :integer
  end
end
