require "test_helper"

class SampleItinerariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sample_itineraries_index_url
    assert_response :success
  end
end
