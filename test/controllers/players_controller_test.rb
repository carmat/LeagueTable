require 'test_helper'

class PlayersControllerTest < ActionController::TestCase

  def setup
    @player = players(:example)
    @other_player = players(:bloggs)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @player
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @player, player: { name: @player.name, email: @player.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong player" do
    log_in_as(@other_player)
    get :edit, id: @player
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong player" do
    log_in_as(@other_player)
    patch :update, id: @player, player: { name: @player.name, email: @player.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
