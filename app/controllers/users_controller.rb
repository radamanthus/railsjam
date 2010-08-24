class UsersController < ApplicationController
  
  before_filter :require_user, :only => [:edit, :update]
    
    
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_back_or_default root_url
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    
    @user = User.find(current_user.id)
    
  end


  def update

    @user = User.find(current_user.id)

    
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
    
        format.html { redirect_to account_url, :notice=>"Your details have been updated" }
      else
        format.html { render :action => "edit" }

      end
    end
    
  end
  
  
end
