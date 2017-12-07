class EventsController < ApplicationController
  before_action :authorized, only: [:edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(session[:email])
    @event = Event.new(event_params)
    @start_hour = params[:event]["date(4i)"].to_i
    @start_min = params[:event]["date(5i)"].to_i
    @month = params[:event]["date(2i)"].to_i
    @day = params[:event]["date(3i)"].to_i
    @year = params[:event]["date(1i)"].to_i
    @event.date = DateTime.new(@year,@month,@day,@start_hour,@start_min)
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @comment = Comment.new
  end

  def attendants
    @event = Event.find(params[:id])
  end

  def user_attend
    @user = current_user
    @event = Event.find(params[:id])
    @user.attend_event(@event)
    redirect_to "/users/#{@user.id}/events"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @start_hour = params[:event]["date(4i)"].to_i
    @start_min = params[:event]["date(5i)"].to_i
    @month = params[:event]["date(2i)"].to_i
    @day = params[:event]["date(3i)"].to_i
    @year = params[:event]["date(1i)"].to_i
    @event.date = DateTime.new(@year,@month,@day,@start_hour,@start_min)

    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to new_event_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :price, :category_id, :user_id, :age, :capacity, :location)
  end

  def authorized
    @event = Event.find(params[:id])
    @user = current_user
    if @event.user_id == @user.id
    else
      flash[:message] = "This aint your son!"
      redirect_to event_path(@event)
    end
  end

end
