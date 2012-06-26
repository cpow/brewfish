class CreateGamedPlayersGamedPlayers < ActiveRecord::Migration

  def up
    create_table :refinery_gamed_players do |t|
      t.int :player_id
      t.int :game_id
      t.integer :position

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
