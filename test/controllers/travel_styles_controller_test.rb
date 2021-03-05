require "test_helper"

class TravelStylesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get travel_styles_index_url
    assert_response :success
  end
end
