class AttendeesController < ApplicationController
  before_filter :require_user, :only => :new

  def new
    # TODO: Check if the current user has already signed up for this event
    @attendee = Attendee.new
    @event = Event.find(params[:event_id])
    @user = current_user
    @experience_options = 60.times.collect{|i| [i,i]}
    @programming_language_options = [
      "C/C++",
      "C#",
      "PHP",
      "Python",
      "Ruby 1.8",
      "Ruby 1.9",
      "Smalltalk",
      "Tcl",
      "VB/VB.NET"
    ]      
    @os_options = [
      "Linux/BSD/Solaris",
      "OS X",
      "Windows",
      "Other"
    ]
    @ide_options = [
      "Eclipse",
      "Emacs",
      "Netbeans",
      "Textmate",
      "vim",
      "Visual Studio",
      "Other"
    ]
  end
  
  def create
    # TODO: Check if the current user has already signed up for this event
    @attendee = Attendee.new(
      :event_id => params[:event_id], 
      :user_id => current_user,
      :current_primary_programming_language => params[:current_primary_programming_language],
      :years_of_ruby_experience => params[:years_of_ruby_experience],
      :years_of_programming_experience => params[:years_of_programming_experience],
      :years_of_web_programming_experience => params[:years_of_web_programming_experience],
      :preferred_os => params[:preferred_os],
      :preferred_ide => params[:preferred_ide],
      :has_laptop => params[:has_laptop]
    )
    p "here"
    if @attendee.save
      notice = "Thank you for signing up, #{current_user.name}. See you there!"
      path = event_path(params[:event_id])
    else
      notice = %{Ooops. Cosmic rays coming from the recent Solar Tsunami (see <a href="http://www.nowpublic.com/tech-biz/solar-tsunami-space-storm-headed-toward-earth-2646788.html") caused a server error during your signup. Please try again.}
      path = new_event_attendee_path(params[:event_id])
    end
    flash[:notice] = notice
    redirect_to path, :notice => notice
  end
    
end