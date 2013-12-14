class Web::Admin::PostsController < ApplicationController
  def index
    @posts = Post.web
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
    @post = Post.find params[:id]
    @post.mark_as_deleted!

    redirect_to posts_path
  end

  def publish
    @post = Post.find params[:id]
    @post.publish

    redirect_to admin_posts_path
  end
end
