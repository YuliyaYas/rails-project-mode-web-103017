class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @start_hour = params[:event]["date(4i)"].to_i
    @start_min = params[:event]["date(5i)"].to_i
    @month = params[:event]["date(2i)"].to_i
    @day = params[:event]["date(3i)"].to_i
    @year = params[:event]["date(1i)"].to_i
    @date = DateTime.new(@year,@month,@day,@start_hour,@start_min)
    @event = Event.create(name:params[:event][:name], description: params[:event][:description], price: params[:event][:price], category_id: params[:event][:category_id], user_id: params[:event][:user_id], date: @date, location:params[:event][:location])
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
  # byebug

  end


  def edit
    @event = Event.find(params[:id])
  end

  def update
    # byebug
    @start_hour = params[:event]["date(4i)"].to_i
    @start_min = params[:event]["date(5i)"].to_i
    @month = params[:event]["date(2i)"].to_i
    @day = params[:event]["date(3i)"].to_i
    @year = params[:event]["date(1i)"].to_i
    @date = DateTime.new(@year,@month,@day,@start_hour,@start_min)
    @event = Event.find(params[:id])
    @event = Event.update(name:params[:event][:name], description: params[:event][:description], price: params[:event][:price], category_id: params[:event][:category_id], user_id: params[:event][:user_id], date: @date, location:params[:event][:location])
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to new_event_path
  end

  private

  def event_params(*args)
    params.require(:event).permit(*args)
  end

end
