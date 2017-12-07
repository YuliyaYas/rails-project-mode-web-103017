class UsersController < ApplicationController
  before_action :logged_in?, only: [:show, :edit, :update, :delete]
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
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in? && current_user.id == params[:id].to_i
         @user = User.find(params[:id])
    else
      @user = User.find(params[:id])
      redirect_to visitor_path(@user)
    end
  end

  def visitor_profile
    @user = User.find(params[:id])
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

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path
  end

  def events
    @user = current_user
    @events = @user.events
    @events_attending = @user.events_attending
  end

  def favorite
    @user = current_user
    @category = Category.find(params[:id])
    @user.add_favorite(@category)
    redirect_to "/users/#{@user.id}/events"
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :email, :password, :password_confirmation)
  end

  def authorized
    if logged_in?
    else
      redirect_to login_path
    end
  end

end
