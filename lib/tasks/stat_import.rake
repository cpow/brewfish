require 'csv'
namespace :import do
  desc "hello rake task"
  task :hello do
    puts "hello"
  end

  desc  "import stats from file"
  task :csv_file => :environment do
    unless Refinery::Seasons::Season.all.count > 0
      season = Refinery::Seasons::Season.create!(year: Time.zone.now) 
    else
      season = Refinery::Seasons::Season.first
    end
    game = Refinery::Games::Game.create!(opponent: "data import #{Time.zone.now}",
                                         season_id: season.id)

    CSV.foreach('/Users/cpow/Downloads/brewfish_stats.csv', :headers => true) do |row|
      data = row.to_hash
      player = Refinery::Players::Player.create!(name: data["Player"],
                                                 bio: "insert bio here (created by import)")
      Refinery::GamedPlayers::GamedPlayer.create!(player_id: player.id, game_id: game.id)
      Refinery::Stats::Stat.create!(player_id: player.id,
                                    game_id: game.id,
                                    walks: data["Walks"],
                                    hits: data["Hits"],
                                    runs: data["Runs"],
                                    at_bats: data["At Bats"],
                                    singles: data["Singles"],
                                    doubles: data["Doubles"],
                                    triples: data["Triples"],
                                    home_runs: data["Home Runs"],
                                    )
    end
  end
end
