class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @player = find_byPlayer.(:email, params[:password_reset][:email].downcase)
    if @player
      @player.create_reset_digest
      @player.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end
end
