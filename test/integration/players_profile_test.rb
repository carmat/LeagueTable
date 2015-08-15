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
    assert_match @player.seasons.count.to_s, response.body
    # assert_select 'div.pagination'
    @player.seasons.paginate(page: 1).each do |season|
      assert_match season.content, response.body
    end
  end
end
