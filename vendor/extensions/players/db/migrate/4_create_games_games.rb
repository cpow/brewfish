class CreateGamesGames < ActiveRecord::Migration

  def up
    create_table :refinery_games do |t|
      t.datetime :date
      t.string :opponent
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-games"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/games/games"})
    end

    drop_table :refinery_games

  end

end
