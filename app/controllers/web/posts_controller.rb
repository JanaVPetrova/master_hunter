class Web::PostsController < Web::ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @posts = Post.active.published
  end

  def new
    @post = PostEditType.new
  end

  def create
    @post = PostEditType.new params[:post]
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
  end
end
