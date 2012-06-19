class CreateSeasonsSeasons < ActiveRecord::Migration

  def up
    create_table :refinery_seasons do |t|
      t.datetime :year
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-seasons"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/seasons/seasons"})
    end

    drop_table :refinery_seasons

  end

end
