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

  test "password_reset" do
    player = players(:carmat)
    player.reset_token = Player.new_token
    mail = PlayerMailer.password_reset(player)
    assert_equal "Reset your password", mail.subject
    assert_equal [player.email], mail.to
    assert_equal ["noreply@leaguetable.test"], mail.from
    assert_match player.reset_token, mail.body.encoded
    assert_match CGI::escape(player.email), mail.body.encoded
  end
end
