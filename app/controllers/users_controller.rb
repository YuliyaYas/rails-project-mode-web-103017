class UsersController < ApplicationController
  before_action :authorized, only: [:show, :edit, :update, :delete]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @month = params[:user]["birthday(2i)"]
    @day = params[:user]["birthday(3i)"]
    @year = params[:user]["birthday(1i)"]
    @b_day = "#{@year}-#{@month}-#{@day}".to_date
    @user.birthday = @b_day
    if @user.save
      redirect_to @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if current_user.id == params[:id].to_i
         @user = User.find(params[:id])
    else
       redirect_to user_path(current_user.id)
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @month = params[:user]["birthday(2i)"]
    @day = params[:user]["birthday(3i)"]
    @year = params[:user]["birthday(1i)"]
    @b_day = "#{@year}-#{@month}-#{@day}".to_date
    @user.birthday = @b_day

    # @month = params[:user]["birthday(2i)"]
    # @day = params[:user]["birthday(3i)"]
    # @year = params[:user]["birthday(1i)"]
    # @b_day = "#{@year}-#{@month}-#{@day}".to_date
    # @user = User.find(params[:id])
    # @user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], birthday: @b_day)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :email, :password, :password_confirmation)
  end

  def authorized
    if logged_in?
    else
      redirect_to signin_path
    end
  end

end
