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
    #@start_time = "#{@start_hour}:#{@start_min}"
    byebug
    @event = Event.create(name: params[:event][:name], description: params[:event][:description], price: params[:event][:price], )

    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
  end


  def edit
    @event = Event.find(params[:id])
  end

  def update
    @month = params[:user]["birthday(2i)"]
    @day = params[:user]["birthday(3i)"]
    @year = params[:user]["birthday(1i)"]
    @date = "#{@month}-#{@day}-#{@year}".to_date
    @event = Event.find(params[:id])
    @event.event_date = @date
    @event.update(first_name: params[:event][:first_name], last_name: params[:event][:last_name])
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
