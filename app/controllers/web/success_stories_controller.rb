class Web::SuccessStoriesController < ApplicationController
  def index
    @posts = Post.active.published.success
  end
end
