require 'spec_helper'

describe HomeController do
  
  fixtures :tweets

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
