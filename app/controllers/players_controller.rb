class PlayersController < ApplicationController
  before_action :logged_in_player, only: [:edit, :update]
  before_action :correct_player, only: [:edit, :update]

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
    @player = Player.new(player_params)

    if @player.save
      log_in @player
      flash[:success] = "Welcome to LeagueTable"
      redirect_to @player
    else
      render "new"
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      flash[:success] = "Profile updated"
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

    def logged_in_player
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    def correct_player
      @player = Player.find(params[:id])
      redirect_to(root_url) unless current_player?(@player)
    end
end
