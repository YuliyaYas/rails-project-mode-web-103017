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
        flash[:success] = "Welcome!"
        redirect_to user_path(@user)
      else
        flash[:danger] = "Get Big!"
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
      if logged_in? && current_user.id == params[:id].to_i
        @user = User.find(params[:id])
        @user.update(user_params)
        @month = params[:user]["birthday(2i)"]
        @day = params[:user]["birthday(3i)"]
        @year = params[:user]["birthday(1i)"]
        @b_day = "#{@year}-#{@month}-#{@day}".to_date
        @user.birthday = @b_day
        flash[:success] = "Your Profile Has Been Updated!"
        redirect_to user_path(@user)
      else
        flash[:danger] = "This aint you SON!"
      end
    end

    def destroy
        if logged_in? && current_user.id == params[:id].to_i
          @user = User.find(params[:id])
          @user.destroy
          flash[:success] = "Your Profile Has Been Deleted!"
          redirect_to signup_path
        else
          flash[:danger] = "This aint you SON!"
        end
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
      flash[:success] = "#{@category.name} was added to your favourites!"
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
