require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
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
end
