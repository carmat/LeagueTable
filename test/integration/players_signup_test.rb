require 'test_helper'

class PlayersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Player.count' do
      post players_path, player: {
        name: "",
        email: "player@invalid",
        password: "foo",
        password_confirmation: "bar"
      }
    end
    assert_template 'players/new'
    # assert_select 'div#error_explation'
    # assert_select 'div.field_with_errors'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'Player.count', 1 do
      post players_path, player: {
        name: "Example",
        email: "player@example.com",
        password: "password",
        password_confirmation: "password"
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    player = assigns(:player)
    assert_not player.activated?

    # Try to log in before activation
    log_in_as(player)
    assert_not is_logged_in?

    # Invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?

    # Valid token, wrong email
    get edit_account_activation_path(player.activation_token, email: "wrong")
    assert_not is_logged_in?

    # Valid activation token
    get edit_account_activation_path(player.activation_token, email: player.email)
    assert player.reload.activated?
    follow_redirect!
    assert_template 'players/show'
    assert is_logged_in?
  end
end
