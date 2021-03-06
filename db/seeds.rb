# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

games = Game.create!([{ name: 'Round 1' }, { name: 'Round 2' }])
g1_players = Player.create!([
  { name: 'Dave', game: games.first },
  { name: 'Sarah', game: games.first },
  { name: 'Kingston', game: games.first },
  { name: 'Jason', game: games.first }
])
# Dave -> Jason -> Kingston -> Sarah -> Dave
g1_players.each_with_index { |p, i|
  Objective.create!([
    {
      player_id: p.id,
      rival_id: g1_players[i-1].id,
      is_target: true
    }
  ])
}