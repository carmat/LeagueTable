require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase

  def setup
    @season = seasons(:inaugural)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Season.count' do
      post :create, season: { name: "Lorem Ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Season.count' do
      delete :destroy, id: @season
    end
    assert_redirected_to login_url
  end
end
