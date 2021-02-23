class AthletesController < ApplicationController
  def index
  end
  
  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def athlete_params
    params.require(:athlete).permit(:name, :birthday, :prefecture_id, :affiliation_id)
  end

end
