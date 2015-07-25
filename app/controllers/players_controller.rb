class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    # render plain: params[:player].inspect
    @player = Player.new(player_params)

    if @player.save
      flash[:success] = "Welcome to LeagueTable"
      redirect_to @player
    else
      render "new"
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to @player
    else
      render "edit"
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private
    def player_params
      params.require(:player).permit(:name, :email, :password, :password_confirmation)
    end
end
