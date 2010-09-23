require 'spec_helper'

require 'authlogic/test_case'

describe PasswordResetsController do
  
  fixtures :users
  setup :activate_authlogic
  fixtures :roles
  fixtures :roles_users
  fixtures :users

  describe "POST new" do 
    
    before do
      @user = Factory.create(:user)
    end
    
    it 'should redirect to root if email is valid' do
      post :create, :email=>@user.email
      
      flash[:notice].should_not == nil
      response.should redirect_to(root_url)
    end
    
    it 'should redirect to new password_reset url if email is not valid' do
      post :create, :email=>"peace"
      
      flash[:error].should == "Please enter a valid email address"
      response.should render_template('new')
    end

    it 'should redirect to new password_reset url if email is does not exist on records' do
      
      post :create, :email=>"peace@world.com"
      
      flash[:error].should == "No user was found with email address peace@world.com"
      response.should render_template('new')
    end
    
  end
  
end