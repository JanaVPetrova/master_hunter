class Web::PostsController < Web::ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
