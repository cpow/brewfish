module Refinery
  module Stats
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Stats

      engine_name :refinery_players

      initializer "register refinerycms_stats plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "stats"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.stats_admin_stats_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/stats/stat'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Stats)
      end
    end
  end
end
