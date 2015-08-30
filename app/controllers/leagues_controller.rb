class LeaguesController < ApplicationController
  # @season = Season.find(params[:season_id])

  # def index
  #   @leagues = League.all
  # end

  # def show
  #   @league = League.find(params[:id])
  # end

  # def new
  #   @league = League.new
  # end

  # def edit
  #   @league = League.find(params[:id])
  # end

  # def create
  #   # render plain: params[:league].inspect
  #   @league = @season.leagues.create(league_params)
  #   redirect_to season_path(@season)
  # end

  # def update
  #   @league = @season.leagues.find(params[:id])

  #   redirect_to season_path(@season)
  # end

  # def destroy
  #   @league = @season.leagues.find(params[:id])
  #   @league.destroy

  #   redirect_to season_path(@season)
  # end

  # private

  #   def league_params
  #     params.require(:league).permit(:name)
  #   end
end
