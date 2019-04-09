require 'test_helper'

class UkrainianToursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ukrainian_tours_index_url
    assert_response :success
  end

end
