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
    @athletes = Athlete.all
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

    #csv記述
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_scores_csv(@scores)
      end
    end
    #csv記述
  end

  private

  def score_params
    # params.require(:score).permit(:game_id, :athlete_id, :floor_d, :pommel_d, :rings_d, :vault_d, :parallel_d, :horizontal_d, :floor_e, :pommel_e, :rings_e, :vault_e,:parallel_e, :horizontal_e, :floor_nd, :pommel_nd, :rings_nd, :vault_nd, :parallel_nd, :horizontal_nd)
    params.permit(:game_id, :athlete_id, :floor_d, :pommel_d, :rings_d, :vault_d, :parallel_d, :horizontal_d, :floor_e, :pommel_e, :rings_e, :vault_e,:parallel_e, :horizontal_e, :floor_nd, :pommel_nd, :rings_nd, :vault_nd, :parallel_nd, :horizontal_nd)
  end

  def send_scores_csv(scores)
    csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932)  do |csv|
      header = %w(name / FX PH Ri Vo PB HB 計算欄)
      csv << header
      scores.each do |score|
        # values_event = ["","FX","PH","Ri","Vo","PB","HB"]
        values_d = [score.athlete.name,"D", score.floor_d, score.pommel_d, score.rings_d, score.vault_d, score.parallel_d, score.horizontal_d]
        values_e = ["", "E", score.floor_e, score.pommel_e, score.rings_e, score.vault_e,score.parallel_e, score.horizontal_e]
        values_nd = ["", "ND", score.floor_nd, score.pommel_nd, score.rings_nd, score.vault_nd, score.parallel_nd, score.horizontal_nd]
        # csv << values_event
        csv << values_d
        csv << values_e
        csv << values_nd
      end
    end
    send_data(csv_data, filename: "#{@game.name}.csv")

  end

end
