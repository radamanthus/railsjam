class UsersController < ApplicationController
  
  filter_access_to :all
    
    
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
      flash[:notice] = "User has been created"
      redirect_to new_user_session_path
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
