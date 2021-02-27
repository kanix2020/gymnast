class ScoresController < ApplicationController
  require 'csv'

  def index
    @games = Game.all
    @scores = Score.all
    @athletes = Athlete.all
  end

  def new
    @score = Score.new
  end

  def create
    @scores = Score.all
    @athletes = Athlete.all
    @games = Game.all
    @score = Score.new(score_params)
    if @score.save
      redirect_to scores_path
    else
      redirect_to scores_path
      # render :index
    end
  end

  def show
    @game = Game.find(params[:id])
    @scores = @game.scores.order(:id)

    # csv記述
    respond_to do |format|
      format.html
      format.csv do |_csv|
        send_scores_csv(@scores)
      end
    end
    # csv記述
  end

  private

  def score_params
    params.permit(:game_id, :athlete_id, :floor_d, :pommel_d, :rings_d, :vault_d, :parallel_d, :horizontal_d, :floor_e,
                  :pommel_e, :rings_e, :vault_e, :parallel_e, :horizontal_e, :floor_nd, :pommel_nd, :rings_nd, :vault_nd, :parallel_nd, :horizontal_nd)
  end

  def send_scores_csv(scores)
    csv_data = CSV.generate(row_sep: "\r\n", encoding: Encoding::CP932) do |csv|
      header = %w[name － FX PH Ri Vo PB HB Total]
      csv << header
      scores.each do |score|
        values_d = [score.athlete.name, 'D', score.floor_d, score.pommel_d, score.rings_d, score.vault_d, score.parallel_d,
                    score.horizontal_d]
        values_e = ['', 'E', score.floor_e, score.pommel_e, score.rings_e, score.vault_e, score.parallel_e, score.horizontal_e]
        values_nd = ['', 'ND', score.floor_nd, score.pommel_nd, score.rings_nd, score.vault_nd, score.parallel_nd,
                     score.horizontal_nd]
        values_total = ['', '－', (score.floor_d + score.floor_e - score.floor_nd).floor(2), (score.pommel_d + score.pommel_e - score.pommel_nd).floor(2), (score.rings_d + score.rings_e - score.rings_nd).floor(2), (score.vault_d + score.vault_e - score.vault_nd).floor(2), (score.parallel_d + score.parallel_e - score.parallel_nd).floor(2), (score.horizontal_d + score.horizontal_e - score.horizontal_nd).floor(2),
                        ((score.floor_d + score.floor_e - score.floor_nd) + (score.pommel_d + score.pommel_e - score.pommel_nd) + (score.rings_d + score.rings_e - score.rings_nd) + (score.vault_d + score.vault_e - score.vault_nd) + (score.parallel_d + score.parallel_e - score.parallel_nd) + (score.horizontal_d + score.horizontal_e - score.horizontal_nd)).floor(2)]

        csv << values_d
        csv << values_e
        csv << values_nd
        csv << values_total
      end
    end
    send_data(csv_data, filename: "#{@game.name}.csv")
  end
end
