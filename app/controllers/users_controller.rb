class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @month = params[:user]["birthday(2i)"]
    @day = params[:user]["birthday(3i)"]
    @year = params[:user]["birthday(1i)"]
    @b_day = "#{@month}-#{@day}-#{@year}".to_date
    @user = User.create(user_params(:first_name, :last_name, :birthday))
    # byebug
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end


end
