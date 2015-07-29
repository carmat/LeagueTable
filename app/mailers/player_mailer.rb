class PlayerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.player_mailer.account_activation.subject
  #
  def account_activation(player)
    @player = player
    mail to: player.email, subject: "Activate your account"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.player_mailer.password_reset.subject
  #
  def password_reset(player)
    @player = player
    mail to: player.email, subject: "Reset your password"
  end
end
