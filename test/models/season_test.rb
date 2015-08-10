require 'test_helper'

class SeasonTest < ActiveSupport::TestCase

  def setup
    @player = players(:carmat)
    @season = @player.seasons.build(name: "Lorem Ipsum", admin: @player.id)
  end

  test "should be valid" do
    assert @season.valid?
  end

  test "player id should be present" do
    @season.admin = nil
    assert_not @season.valid?
  end

  test "name should be present" do
    @season.name = "   "
    assert_not @season.valid?
  end

  test "order should be inaugural first" do
    assert_equal seasons(:inaugural), Season.first
  end
end
