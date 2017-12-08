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
        flash[:success] = "Welcome Back #{@user.first_name}!"
        redirect_to @user
      else
        flash[:danger] = "Wrong!...What is this? Amateur Hour?"
        redirect_to login_path
      end
    end

    def destroy
        session[:email] = nil
        flash[:danger] = "We Didn't Want You Here ANYWAY!"
        redirect_to login_path
      end
end
