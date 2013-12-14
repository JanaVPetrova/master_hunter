require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
  end

  test 'shoult get index' do
    get :index

    assert_response :success
  end

  test 'should get new' do
    get :new

    assert_response :success
  end

  test 'should post create' do
    attrs = attributes_for :post

    post :create, post: attrs

    assert_response :redirect
    assert { Post.last.description == attrs[:description] }
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

  test 'should patch update' do
    attrs = attributes_for(:post).extract!(:description, :place, :date, :nickname)

    patch :update, id: @post, post: attrs

    assert_response :redirect
    @post.reload
    assert { @post.description == attrs[:description] }
  end
end
