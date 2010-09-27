class SponsorsController < ApplicationController
  
  filter_access_to :all
    
  before_filter :find_sponsor, :only => [:show, :edit, :update, :destroy]


  def index
    @sponsors = Sponsor.all

    respond_to do |wants|
      wants.html 
    end
  end


  def show
    respond_to do |wants|
      wants.html 
    end
  end


  def new
    @sponsor = Sponsor.new

    respond_to do |wants|
      wants.html 
    end
  end


  def edit
  end


  def create
    @sponsor = Sponsor.new(params[:sponsor])

    respond_to do |wants|
      if @sponsor.save
        flash[:notice] = 'Sponsor was successfully created.'
        wants.html { redirect_to(@sponsor) }

      else
        wants.html { render :action => "new" }

      end
    end
  end


  def update
    respond_to do |wants|
      if @sponsor.update_attributes(params[:sponsor])
        flash[:notice] = 'Sponsor was successfully updated.'
        wants.html { redirect_to(@sponsor) }

      else
        wants.html { render :action => "edit" }

      end
    end
  end


  def destroy
    @sponsor.destroy

    respond_to do |wants|
      wants.html { redirect_to(sponsors_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

end
