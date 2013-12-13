require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new

    assert_response :success
  end

  test 'should post create' do
    attrs = attributes_for :user

    post :create, user: attrs

    assert_response :redirect
    assert { User.last.email == attrs[:email] }
  end
end
