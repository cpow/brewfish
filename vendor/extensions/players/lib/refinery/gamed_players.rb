require 'refinerycms-core'

module Refinery
  autoload :PlayersGenerator, 'generators/refinery/players_generator'

  module GamedPlayers
    require 'refinery/gamed_players/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
