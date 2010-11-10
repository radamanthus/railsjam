class PasswordResetsController < ApplicationController
  
  include ApplicationHelper
 
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]

  def new
    
  end

  def create
    @user = User.find_by_email(params[:email])
    
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you"
      redirect_to root_url
    elsif !@user and !valid_email(params[:email])
      flash[:error] = "Please enter a valid email address"
      redirect_to new_password_reset_url
    else
      flash[:error] = "No user was found with email address #{params[:email]}"
      redirect_to new_password_reset_url
    end
  end

  def edit
     @user.password =""
     @user.password_confirmation =""
  end

  def update
    
      @user.password = params[:password] 
      @user.password_confirmation = params[:password_confirmation]
    
    # TO DO : Move this model file 
    
    if !@user.password.blank? && !@user.password_confirmation.blank? && (@user.password==@user.password_confirmation) &&  @user.password.size > 5 && @user.password_confirmation.size > 5
        @user.save 
        flash[:success] = "Your password was successfully updated"
        redirect_to root_url
    elsif !@user.password.blank? && !@user.password_confirmation.blank? && (@user.password!=@user.password_confirmation) &&  @user.password.size > 5 && @user.password_confirmation.size > 5
      flash[:error] = "Your passwords do not match."
      render :action => :edit
    elsif !@user.password.blank? && !@user.password_confirmation.blank? && (@user.password!=@user.password_confirmation) &&  @user.password.size <= 5 && @user.password_confirmation.size <= 5

      flash[:error] = "Your passwords do not match and do not have at least 6 characters in length."
      render :action => :edit
 
    elsif !@user.password.blank? && !@user.password_confirmation.blank? && (@user.password==@user.password_confirmation) &&  @user.password.size <= 5 && @user.password_confirmation.size <= 5

      flash[:error] = "Your password must be at least 5 characters"
      render :action => :edit           
            
    else
      flash[:error] = "Your password could not be updated. Please make sure that they match and have at least 5 characters in length."
      render :action => :edit
      
    end
    
  end


  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = "We're sorry, but we could not locate your account"
      redirect_to root_url
    end
  end
  
end
