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

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post = @post.becomes PostEditType

    if @post.update params[:post]
      redirect_to @post
    else
      render :edit
    end
  end
end
