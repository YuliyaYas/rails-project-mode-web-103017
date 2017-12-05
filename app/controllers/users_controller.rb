class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @month = params[:user]["birthday(2i)"]
    @day = params[:user]["birthday(3i)"]
    @year = params[:user]["birthday(1i)"]
    @b_day = "#{@year}-#{@month}-#{@day}".to_date
    @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], birthday: @b_day)

    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @month = params[:user]["birthday(2i)"]
    @day = params[:user]["birthday(3i)"]
    @year = params[:user]["birthday(1i)"]
    @b_day = "#{@year}-#{@month}-#{@day}".to_date
    @user = User.find(params[:id])
    @user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], birthday: @b_day)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end


end
