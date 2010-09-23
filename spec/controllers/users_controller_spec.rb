require 'spec_helper'

describe UsersController do
  
  fixtures :roles
  fixtures :roles_users
  fixtures :users
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
   # it "should have the right title" do
    #  get 'new'
     # response.should have_selector("title", :content => "Sign up")
   #  response.should be success
   # end
  end

end
