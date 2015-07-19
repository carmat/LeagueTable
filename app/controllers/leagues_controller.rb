class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def edit
    @league = League.find(params[:id])
  end

  def create
    # render plain: params[:league].inspect
    @league = League.new(league_params)

    if @league.save
      redirect_to @league
    else
      render "new"
    end
  end

  def update
    @league = League.find(params[:id])

    if @league.update(league_params)
      redirect_to @league
    else
      render "edit"
    end
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy

    redirect_to leagues_path
  end

  private
    def league_params
      params.require(:league).permit(:name, :rel_places, :rel_playoff_places, :promo_places, :promo_playoff_places, :previous_league)
    end
end
