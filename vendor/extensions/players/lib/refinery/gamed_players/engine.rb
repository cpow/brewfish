module Refinery
  module GamedPlayers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::GamedPlayers

      engine_name :refinery_players

      initializer "register refinerycms_gamed_players plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "gamed_players"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.gamed_players_admin_gamed_players_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/gamed_players/gamed_player'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::GamedPlayers)
      end
    end
  end
end
