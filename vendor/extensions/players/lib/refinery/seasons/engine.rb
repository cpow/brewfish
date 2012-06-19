module Refinery
  module Seasons
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Seasons

      engine_name :refinery_players

      initializer "register refinerycms_seasons plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "seasons"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.seasons_admin_seasons_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/seasons/season'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Seasons)
      end
    end
  end
end
