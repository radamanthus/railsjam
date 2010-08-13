class AttendeesController < ApplicationController
  before_filter :require_user, :only => :new

  def new
    @attendee = Attendee.new
    @event = Event.find(params[:event_id])
    @user = current_user
  end
  
  def create
    if params[:commit].eql?("Yes")
      @attendee = Attendee.new(:event_id => params[:event_id], :user_id => current_user)
      if @attendee.save
        #TODO show proper flash message
        flash[:success] = "Thank You"
      else
        #TODO show proper flash message
        flash[:error] = "Failed"
      end
    end
    redirect_to events_url
  end
    
end