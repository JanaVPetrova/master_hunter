require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @user = create :user

    sign_in @user
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
    attrs[:user_id] = @user.id

    post :create, post: attrs

    assert_response :redirect
    assert { Post.last.description == attrs[:description] }
    assert { Post.last.user == current_user }
  end
end
