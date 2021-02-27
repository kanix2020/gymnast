class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to scores_path
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :event_day, :prefecture_id, :venue)
  end
end
