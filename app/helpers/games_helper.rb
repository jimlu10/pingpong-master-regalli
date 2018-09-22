module GamesHelper
  def opponent(game)
    current_user == game.player ? game.opponent.username : game.player.username
  end

  def result(game)
    game.winner_id == current_user.id ? 'W' : 'L'
  end

  def score(game)
    if current_user == game.player
      "#{game.player_score}-#{game.opponent_score}"
    else
      "#{game.opponent_score}-#{game.player_score}"
    end
  end
end
