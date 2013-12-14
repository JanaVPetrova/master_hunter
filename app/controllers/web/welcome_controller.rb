class Web::WelcomeController < Web::ApplicationController
  def index
    @posts = Post.last 10
  end
end
