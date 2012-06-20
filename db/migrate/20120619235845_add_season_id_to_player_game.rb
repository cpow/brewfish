class AddSeasonIdToPlayerGame < ActiveRecord::Migration
  def change
    add_column :player_games, :season_id, :int
  end
end
