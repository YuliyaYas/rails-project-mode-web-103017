class SessionsController < ApplicationController

  def new
    if session[:email]
      redirect_to current_user
    end
  end


  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])

      session[:email] = @user.id
      flash[:message] = "Welcome #{@user.to_s}"
      redirect_to @user
    else
      flash[:message] = "Wrong username and password"
      redirect_to login_path
    end
  end

  def destroy
    session[:email] = nil
    redirect_to login_path
  end
end
