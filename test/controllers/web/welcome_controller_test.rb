require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  test "get index" do
    get :index
    assert_response :success
  end
end
