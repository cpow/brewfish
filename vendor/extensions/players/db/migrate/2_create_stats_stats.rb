class CreateStatsStats < ActiveRecord::Migration

  def up
    create_table :refinery_stats do |t|
      t.integer :at_bats
      t.integer :walks
      t.integer :singles
      t.integer :doubles
      t.integer :triples
      t.integer :home_runs
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-stats"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/stats/stats"})
    end

    drop_table :refinery_stats

  end

end
