class EventsController < ApplicationController
  
  before_filter :require_admin, :only => [:new, :create, :update, :edit]
  
  
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
    @title = @event.name
  end
  
  def new
    @event = Event.new
  end
  
  
  def edit
    @event = Event.find(params[:id])
    
  end
  
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
    
  end
  
  def update
    
    
  end
  
  
  
end
