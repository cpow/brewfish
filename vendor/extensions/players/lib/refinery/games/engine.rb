module Refinery
  module Games
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Games

      engine_name :refinery_players

      initializer "register refinerycms_games plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "games"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.games_admin_games_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/games/game',
            :title => 'opponent'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Games)
      end
    end
  end
end
