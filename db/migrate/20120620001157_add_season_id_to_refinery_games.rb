class AddSeasonIdToRefineryGames < ActiveRecord::Migration
  def change
    add_column :refinery_games, :season_id, :int
  end
end
