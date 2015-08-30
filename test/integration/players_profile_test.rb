require 'test_helper'

class PlayersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @player = players(:carmat)
  end

  test "profile display" do
    get player_path(@player)
    assert_template 'players/show'
    # assert_select 'name', full_title(@player.name)
    assert_select '.player-meta__name', text: @player.name
    assert_select '.player-meta__email', text: @player.email
    # assert_select '.player-meta__email', text: @player.email
    # assert_select 'div.pagination'
  end
end
