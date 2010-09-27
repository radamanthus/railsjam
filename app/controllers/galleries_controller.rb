class GalleriesController < ApplicationController
  
  filter_access_to :all
  before_filter :find_gallery, :only => [:show, :edit, :update, :destroy]

  def index
    @gallerys = Gallery.all

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
    @gallery = Gallery.new

    respond_to do |wants|
      wants.html
    end
  end


  def edit
  end


  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |wants|
      if @gallery.save
        flash[:notice] = 'Gallery was successfully created.'
        wants.html { redirect_to(@gallery) }

      else
        wants.html { render :action => "new" }

      end
    end
  end


  def update
    respond_to do |wants|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Gallery was successfully updated.'
        wants.html { redirect_to(@gallery) }

      else
        wants.html { render :action => "edit" }

      end
    end
  end


  def destroy
    @gallery.destroy

    respond_to do |wants|
      wants.html { redirect_to(gallerys_url) }

    end
  end

  private
    def find_gallery
      @gallery = Gallery.find(params[:id])
    end

end
