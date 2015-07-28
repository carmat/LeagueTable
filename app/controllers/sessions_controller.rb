class SessionsController < ApplicationController

  def new
  end

  def create
    player = Player.find_by(email: params[:session][:email].downcase)

    if player && player.authenticate(params[:session][:password])
      if player.activated?
        log_in player
        params[:session][:remember_me] == '1' ? remember(player) : forget(player)
        redirect_back_or player
      else
        message = "Account not activated"
        message += "Check your email for the activation link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
