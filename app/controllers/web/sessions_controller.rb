class Web::SessionsController < Web::ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new params[:user]

    if @session.valid?
      sign_in @session.user
      redirect_to root_path
    else
      render :new
    end
  end
end
