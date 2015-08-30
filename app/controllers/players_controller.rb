class PlayersController < ApplicationController
  before_action :logged_in_player, only: [:index, :edit, :update, :destroy]
  before_action :correct_player, only: [:edit, :update]
  before_action :admin_player, only: :destroy

  def index
    @players = Player.paginate(page: params[:page], per_page: 10)
  end

  def show
    @player = Player.find(params[:id])
    # @seasons = @player.seasons.paginate(page: params[:page], :per_page => 3).where(admin: @player.id)
    # @season = @player.seasons.build if logged_in?
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
      @player.send_activaton_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
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
    @player = Player.find(params[:id]).destroy
    flash[:success] = "Player deleted"
    redirect_to players_url
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

    def admin_player
      redirect_to(root_url) unless current_player.admin?
    end
end
