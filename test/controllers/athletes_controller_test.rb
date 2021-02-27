require 'test_helper'

class AthletesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get athletes_index_url
    assert_response :success
  end
end
