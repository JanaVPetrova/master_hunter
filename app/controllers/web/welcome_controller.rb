class Web::WelcomeController < Web::ApplicationController
  def index
    @posts = Post.published.last 10
  end
end
