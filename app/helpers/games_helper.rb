module GamesHelper
  def get_competitors_of(player_id, game)
    if game.nil?
      []
    else
      game.players.select { |p|
        p.alive && p.id != player_id
      }
    end
  end
end
