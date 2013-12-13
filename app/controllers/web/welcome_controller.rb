class Web::WelcomeController < Web::ApplicationController
  def index
    @posts = Post.active.published.last 10
  end
end
