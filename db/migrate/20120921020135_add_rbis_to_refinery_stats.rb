class AddRbisToRefineryStats < ActiveRecord::Migration
  def change
    add_column :refinery_stats, :rbis, :integer
  end
end
