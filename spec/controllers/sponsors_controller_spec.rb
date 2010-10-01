require 'spec_helper'

describe SponsorsController do
  
  render_views
  fixtures :sponsors
  fixtures :roles
  fixtures :roles_users
  fixtures :users
  setup :activate_authlogic
  
  def mock_sponsor(stubs={})
    @mock_sponsor ||= mock_model(Sponsor, stubs).as_null_object 
  end

  describe "GET index" do
    
     before do
        require_admin
     end
     
    it "assigns all sponsors as @sponsors" do

      get :index

      response.should be_success
    end
  end


  describe "GET new" do
    
     before do
        require_admin
     end
    it "assigns a new sponsor as @sponsor" do
      Sponsor.stub(:new) { mock_sponsor }
      get :new
      assigns(:sponsor).should be(mock_sponsor)
    end
  end

  describe "GET edit" do
    
     before do
        require_admin
     end
     
    it "assigns the requested sponsor as @sponsor" do
      Sponsor.stub(:find).with("37") { mock_sponsor }
      get :edit, :id => "37"

    end
  end

  describe "POST create" do

     before do
        require_admin
     end
     
    describe "with valid params" do
      it "assigns a newly created sponsor as @sponsor" do

        post :create, :sponsor => {:name=>"Test", :description=>"Test", :link=>"http://google.com"}
        assigns(:sponsor).name.should == "Test"
      end

      it "redirects to the index" do
        post :create, :sponsor => {:name=>"Test", :description=>"Test", :link=>"http://google.com"}
        response.should redirect_to(sponsors_url)
      end
    end

    describe "with invalid params" do

      it "re-renders the 'new' template" do

        post :create, :sponsor => {:name=>""}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
     before do
        require_admin
     end

    describe "with valid params" do
      it "updates the requested sponsor" do
        Sponsor.should_receive(:find).with("37") { mock_sponsor }
        mock_sponsor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sponsor => {'these' => 'params'}
      end

      it "assigns the requested sponsor as @sponsor" do
        Sponsor.stub(:find) { mock_sponsor(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:sponsor).should be(mock_sponsor)
      end

      it "redirects to the sponsor" do
        Sponsor.stub(:find) { mock_sponsor(:update_attributes => true) }
        put :update, :id => "1"
        response.should  redirect_to(sponsors_url)
      end
    end

    describe "with invalid params" do
      it "assigns the sponsor as @sponsor" do
        Sponsor.stub(:find) { mock_sponsor(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:sponsor).should be(mock_sponsor)
      end

      it "re-renders the 'edit' template" do
        Sponsor.stub(:find) { mock_sponsor(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    
      before do
       require_admin
     end
     
    it "destroys the requested sponsor" do
      Sponsor.should_receive(:find).with("37") { mock_sponsor }
      mock_sponsor.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sponsors list" do
      Sponsor.stub(:find) { mock_sponsor }
      delete :destroy, :id => "1"
      response.should redirect_to(sponsors_url)
    end
  end

end
