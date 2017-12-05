class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params(:first_name, :last_name, :birthdate))
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
