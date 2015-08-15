class SeasonsController < ApplicationController
  before_action :logged_in_player, only: [:index, :create, :destroy]

  def index
    @seasons = Season.all
    @seasons = Season.paginate(page: params[:page], :per_page => 5)
  end

  def show
    @season = Season.find(params[:id])
  end

  def new
    @season = Season.new
  end

  # def edit
  #   @season = Season.find(params[:id])
  # end

  def create
    # render plain: params[:season].inspect
    @season = current_player.seasons.build(season_params)
    @player = Player.find_by(logged_in_player)

    if @season.save
      flash[:success] = "New season created!"
    else
      flash[:danger] = "Oops! Something went wrong."
    end
    render 'players/show'
  end

  # def update
  #   @season = Season.find(params[:id])

  #   if @season.update(season_params)
  #     redirect_to @season
  #   else
  #     render "edit"
  #   end
  # end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy

    redirect_to seasons_path
  end

  private
    def season_params
      params.require(:season).permit(:name)
    end
end
