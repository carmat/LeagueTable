require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  def setup
    @player = Player.new(name: "Example Player", email: "player@example.com")
  end

  test "should be valid" do
    assert @player.valid?
  end
end
