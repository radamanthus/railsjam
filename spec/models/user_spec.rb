require 'spec_helper'

describe User do
  
  
  fixtures :roles
  fixtures :roles_users
  fixtures :users
  setup :activate_authlogic
  
  before(:each) do
    @user = User.new
  end

  describe "user" do 

    it "should not be valid when empty" do
      @user.should_not be_valid
    end

  
  end


   describe "validate presence of fields for new user" do
  
      it { should validate_presence_of(:name) }

   end

   describe "validate formats and length of fields for new user" do
  
      it { should_not allow_value("blah").for(:email) }
     
   end



  describe "is_admin" do 
    
    before(:each) do
      @first = User.first
    end 
 
    it "should display the user's login if first name and last name does not exist" do
       @first.is_admin.should == true
    end 
  
  end  



   describe "assert associations" do

     it { should have_and_belong_to_many(:roles) }

   end
   
   
end
