class PresentationsController < ApplicationController
  
  filter_access_to :all
  
  
  def index
    
    #@events = Event.all 
    @presentations = Presentation.order("created_at DESC").paginate( :page => params[:page], :per_page => 2)

    respond_to do |format|
      format.html
    end
  end


  def show
    @presentation = Presentation.find(params[:id])
    @title = "RailsJam | #{@presentation.title}" 
    respond_to do |format|
      format.html
    end
  end

  def new
    @presentation = Presentation.new
    1.times { @presentation.attachments.build }
    respond_to do |format|
      format.html 
    end
  end


  def edit
    @presentation = Presentation.find(params[:id])
    if @presentation.attachments and @presentation.attachments.size == 0
      1.times { @presentation.attachments.build }      
    end
  end


  def create
    @presentation = Presentation.new(params[:presentation])

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to(@presentation, :notice => 'Presentation was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      if @presentation.update_attributes(params[:presentation])
        format.html { redirect_to(@presentation, :notice => 'Presentation was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.destroy

    respond_to do |format|
      format.html { redirect_to(presentations_url) }
      format.xml  { head :ok }
    end
  end
end
