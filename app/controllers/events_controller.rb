class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
    @title = 'Add Event'
  end

  def show
    @event = Event.find(params[:id])
    @title = @event.name
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      #TODO replace with proper flash message
      flash[:success] = "Event was succesfully added"
      redirect_to @event
    else
      @title = 'Add Event'
      render 'new'
    end
  end

end
