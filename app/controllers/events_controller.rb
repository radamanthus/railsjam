class EventsController < ApplicationController
  
  filter_access_to :all
  
  def index
    @events = Event.order("created_at DESC")
  end
  
  def show
    @event = Event.find(params[:id])
    @title = @event.name
  end
  
  def new
    @event = Event.new
    @event.photos.build if @event.photos.blank?
  end
  
  
  def edit
    @event = Event.find(params[:id])
    @event.photos.build if @event.photos.blank?
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
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end    
    
  end
  
  
  
end
