class Web::WelcomeController < Web::ApplicationController
  def index
    @posts = Post.published.processed.last 10
  end
end
