module Refinery
  class PlayersGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_players:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH
# Added by Refinery CMS Players extension
Refinery::Players::Engine.load_seed
Refinery::Stats::Engine.load_seed
Refinery::Games::Engine.load_seed
Refinery::Seasons::Engine.load_seed
Refinery::GamedPlayers::Engine.load_seed
        EOH
      end
    end
  end
end
