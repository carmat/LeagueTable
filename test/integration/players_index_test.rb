require 'test_helper'

class PlayersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @player = players(:example)
  end

  test "index including pagination" do
    log_in_as(@player)
    get players_path
    assert_template 'players/index'
    assert_select 'div.pagination'
    Player.paginate(page: 1, per_page: 10).each do |player|
      assert_select '.player__name', text: player.name
    end
  end
end
