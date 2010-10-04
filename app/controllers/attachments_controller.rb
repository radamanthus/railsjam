class AttachmentsController < ApplicationController
  
  filter_access_to :all
  
  before_filter :find_attachment, :only => [:show, :edit, :update, :destroy]

  def index
    
    @title = "RailsJam | Manage Attachments"
    @attachments = Attachment.all

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
    @attachment = Attachment.new

    respond_to do |wants|
      wants.html
    end
  end


  def edit
  end


  def create
    @attachment = Attachment.new(params[:attachment])

    respond_to do |wants|
      if @attachment.save
        flash[:notice] = 'Attachment was successfully created.'
        wants.html { redirect_to(@attachment) }
      else
        wants.html { render :action => "new" }
      end
    end
  end


  def update
    respond_to do |wants|
      if @attachment.update_attributes(params[:attachment])
        flash[:notice] = 'Attachment was successfully updated.'
        wants.html { redirect_to(@attachment) }
      else
        wants.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @attachment.file.destroy 
    @attachment.destroy

    @file_id = "#file_#{@attachment.id}"
    @file_field_id = "#file_field_#{@attachment.id}"
    respond_to do |wants|
      wants.html { redirect_to(attachments_url) }
      wants.js {
        render :update do |page|
          page << "$('#{@file_id}').remove();"
          page << "$('#{@file_field_id}').remove();"
        end
      }
    end
  end

  private
    def find_attachment
      @attachment = Attachment.find(params[:id])
    end

end
