# This migration comes from refinery_players (originally 1)
class CreatePlayersPlayers < ActiveRecord::Migration

  def up
    create_table :refinery_players do |t|
      t.text :bio
      t.integer :photo_id
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-players"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/players/players"})
    end

    drop_table :refinery_players

  end

end
