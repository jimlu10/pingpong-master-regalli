class GamesController < ApplicationController

  def index
    @games = current_user.games_played
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.player = current_user

    if @game.save
      redirect_to history_path, notice: 'Games was created.'
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:game_date, :player_id, :opponent_id, :player_score, :opponent_score)
  end
end
