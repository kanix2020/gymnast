class ScoresController < ApplicationController
  def index
    @games = Game.all 
    @scores = Score.all
  end
  
  def new
    @score = Score.new
  end
  
  def create
    @games = Game.all
    @scores = Score.all
    @score = Score.new(score_params)
    if @score.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @game = Game.find(params[:id])
    @scores = @game.scores.order(:id)
  end

  private

  def score_params
    # params.require(:score).permit(:game_id, :athlete_id, :floor_d, :pommel_d, :rings_d, :vault_d, :parallel_d, :horizontal_d, :floor_e, :pommel_e, :rings_e, :vault_e,:parallel_e, :horizontal_e, :floor_nd, :pommel_nd, :rings_nd, :vault_nd, :parallel_nd, :horizontal_nd)
    params.permit(:game_id, :athlete_id, :floor_d, :pommel_d, :rings_d, :vault_d, :parallel_d, :horizontal_d, :floor_e, :pommel_e, :rings_e, :vault_e,:parallel_e, :horizontal_e, :floor_nd, :pommel_nd, :rings_nd, :vault_nd, :parallel_nd, :horizontal_nd)
  end

end
