module Refinery
  module Players
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Players

      engine_name :refinery_players

      initializer "register refinerycms_players plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "players"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.players_admin_players_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/players/player',
            :title => 'name'
          }
          
        end
      end
    end
  end
end
