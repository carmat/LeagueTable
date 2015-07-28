require 'test_helper'

class PlayerMailerTest < ActionMailer::TestCase

  test "account_activation" do
    player = players(:carmat)
    player.activation_token = Player.new_token
    mail = PlayerMailer.account_activation(player)
    assert_equal "Activate your account", mail.subject
    assert_equal [player.email], mail.to
    assert_equal ["noreply@leaguetable.test"], mail.from
    assert_match player.name, mail.body.encoded
    assert_match player.activation_token, mail.body.encoded
    assert_match CGI::escape(player.email), mail.body.encoded
  end

  # test "password_reset" do
  #   mail = PlayerMailer.password_reset
  #   assert_equal "Password reset", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["noreply@leaguetable.test"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end
end
