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

  test "should delete post" do
    delete :destroy, id: @post
    @post.reload
    assert_equal true, @post.deleted?
  end

  test 'should patch publish' do
    patch :publish, id: @post

    assert_response :redirect
    @post.reload
    assert { @post.published? }
  end

  test 'should patch success' do
    patch :success, id: @post

    assert_response :redirect
    @post.reload
    assert { @post.success? }
  end

  test 'should get edit' do
    get :edit, id: @post

    assert_response :success
  end

  test 'should patch update' do
    attrs = attributes_for(:post).extract!(:description, :place, :date, :nickname)

    patch :update, id: @post, post: attrs

    assert_response :redirect
    @post.reload
    assert { @post.description == attrs[:description] }
  end
end
