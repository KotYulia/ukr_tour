require 'test_helper'

class EuropeanToursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get european_tours_index_url
    assert_response :success
  end

end
