module Rating
  extend ActiveSupport::Concern

  def update_player(game)
    opponent = game.opponent
    # update_rating(game, opponent)
    update_scores(game, opponent)
    opponent.save
    save
  end

  def update_scores(game, opponent)
    opponent.score = game.opponent_score + opponent.score
    self.score = self.score + game.player_score
  end
end
