class AddGamedPlayerIdToRefineryGames < ActiveRecord::Migration
  def change
    add_column :refinery_games, :gamed_player_id, :integer
  end
end
