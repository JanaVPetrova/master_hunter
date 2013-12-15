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

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to admin_posts_path
  end

  test 'should patch publish' do
    patch :publish, id: @post

    assert_response :redirect
    @post.reload
    assert { @post.published? }
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
