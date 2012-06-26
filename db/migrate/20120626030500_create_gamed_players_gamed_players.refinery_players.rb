# This migration comes from refinery_players (originally 5)
class CreateGamedPlayersGamedPlayers < ActiveRecord::Migration

  def up
    create_table :refinery_gamed_players do |t|
      t.integer :player_id
      t.integer :game_id

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-gamed_players"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/gamed_players/gamed_players"})
    end

    drop_table :refinery_gamed_players

  end

end
