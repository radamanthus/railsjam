class PhotosController < ApplicationController
  
  filter_access_to :all
  before_filter :find_photo, :only => [:show, :edit, :update, :destroy]


  def index
    @photos = Photo.all

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
    @photo = Photo.new

    respond_to do |wants|
      wants.html 
    end
  end


  def edit
  end


  def create
    @photo = Photo.new(params[:photo])

    respond_to do |wants|
      if @photo.save
        flash[:notice] = 'Photo was successfully created.'
        wants.html { redirect_to(@photo) }
      else
        wants.html { render :action => "new" }
      end
    end
  end


  def update
    respond_to do |wants|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        wants.html { redirect_to(@photo) }
      else
        wants.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @photo.destroy
    @file_id = "#file#{@photo.id}"
    @file_field_id = "#file_field#{@photo.id}"
    respond_to do |wants|
      wants.html { redirect_to(photos_url) }
      
      wants.js {
        render :update do |page|
          page << "$('#{@file_id}').remove();"
          page << "$('#{@file_field_id}').remove();"
        end
      }
      
      
    end
  end

  private
    def find_photo
      @photo = Photo.find(params[:id])
    end

end
