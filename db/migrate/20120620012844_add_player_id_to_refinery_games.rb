class AddPlayerIdToRefineryGames < ActiveRecord::Migration
  def change
    add_column :refinery_games, :player_id, :int
  end
end
