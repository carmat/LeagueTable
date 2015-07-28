require 'test_helper'

class PlayersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = players(:carmat)
    @non_admin = players(:bloggs)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get players_path
    assert_template 'players/index'
    assert_select 'div.pagination'
    first_page_of_players = Player.paginate(page: 1, per_page: 10)
    first_page_of_players.each do |player|
      assert_select '.player__name', text: player.name
      unless player == @admin
        assert_select '.player__action a', text: "Delete"
      end
    end
    assert_difference 'Player.count', -1 do
      delete player_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get players_path
    assert_select 'a', text: 'Delete', count: 0
  end
end
