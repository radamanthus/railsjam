class AttendeesController < ApplicationController
  before_filter :require_user, :only => :new

  def new
  end
  
  def create
  end
    
end