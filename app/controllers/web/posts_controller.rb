class Web::PostsController < Web::ApplicationController
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
end
