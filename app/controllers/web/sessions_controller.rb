class Web::SessionsController < Web::ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new params[:user_sign_in_type]

    if @session.valid?
      sign_in @session.user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
