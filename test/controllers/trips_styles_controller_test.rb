require "test_helper"

class TripsStylesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trips_styles_index_url
    assert_response :success
  end
end
