require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test 'should get new' do
    get :new

    assert_response :success
  end

  test 'should post create' do
    attrs = {
      email: @user.email,
      password: @user.password
    }

    post :create, user: attrs

    assert_response :redirect
    assert { current_user == @user }
  end

  test 'should delete destroy' do
    sign_in @user

    delete :destroy

    assert_response :redirect
    assert { !signed_in? }
  end
end