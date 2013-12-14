require 'test_helper'

class Web::Admin::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @admin = create :admin

    sign_in @admin
  end

  test 'shoult get index' do
    get :index

    assert_response :success
  end

  test 'should get show' do
    get :show, id: @post

    assert_response :success
  end

  test 'shoult delete destroy' do
    delete :destroy, id: @post

    assert_response :redirect
    @post.reload
    assert { @post.deleted? }
  end

  test 'should patch publish' do
    patch :publish, id: @post

    assert_response :redirect
    @post.reload
    assert { @post.published? }
  end
end
