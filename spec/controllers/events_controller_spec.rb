require 'spec_helper'

describe EventsController do
  
  render_views
  fixtures :events
  fixtures :roles
  fixtures :roles_users
  fixtures :users
  setup :activate_authlogic
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
