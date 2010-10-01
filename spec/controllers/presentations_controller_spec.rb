require 'spec_helper'

describe PresentationsController do
  
  render_views
  
  fixtures :presentations
  fixtures :roles
  fixtures :roles_users
  fixtures :users
  setup :activate_authlogic
  
  def mock_presentation(stubs={})
    @mock_presentation ||= mock_model(Presentation, stubs).as_null_object
  end

  describe "GET index" do
     before do
        require_admin
     end
    it "lists all events (and an event has many presentations)" do

      get :index
      assigns(:events).should_not be_nil
    end
  end

  describe "GET show" do
    it "assigns the requested presentation as @presentation" do
      Presentation.stub(:find).with("37") { mock_presentation }
      get :show, :id => "37"
      assigns(:presentation).should be(mock_presentation)
    end
  end

  describe "GET new" do
    
      before do
        require_admin
     end
     
    it "assigns a new presentation as @presentation" do
      Presentation.stub(:new) { mock_presentation }
      get :new
      assigns(:presentation).should be(mock_presentation)
    end
  end

  describe "GET edit" do
    
     before do
        require_admin
     end
     
     
    it "assigns the requested presentation as @presentation" do
      Presentation.stub(:find).with("37") { mock_presentation }
      get :edit, :id => "37"
      assigns(:presentation).should be(mock_presentation)
    end
  end

  describe "POST create" do
      before do
        require_admin
     end

    describe "with valid params" do
      
      it "assigns a newly created presentation as @presentation" do
        Presentation.stub(:new).with({'these' => 'params'}) { mock_presentation(:save => true) }
        post :create, :presentation => {'these' => 'params'}
        assigns(:presentation).should be(mock_presentation)
      end

      it "redirects to the created presentation" do
        Presentation.stub(:new) { mock_presentation(:save => true) }
        post :create, :presentation => {}
        response.should redirect_to(presentation_url(mock_presentation))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved presentation as @presentation" do
        Presentation.stub(:new).with({'these' => 'params'}) { mock_presentation(:save => false) }
        post :create, :presentation => {'these' => 'params'}
        assigns(:presentation).should be(mock_presentation)
      end

      it "re-renders the 'new' template" do
        Presentation.stub(:new) { mock_presentation(:save => false) }
        post :create, :presentation => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
    
      before do
        require_admin
     end

    describe "with valid params" do
      it "updates the requested presentation" do
        Presentation.should_receive(:find).with("37") { mock_presentation }
        mock_presentation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :presentation => {'these' => 'params'}
      end

      it "assigns the requested presentation as @presentation" do
        Presentation.stub(:find) { mock_presentation(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:presentation).should be(mock_presentation)
      end

      it "redirects to the presentation" do
        Presentation.stub(:find) { mock_presentation(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(presentation_url(mock_presentation))
      end
    end

    describe "with invalid params" do
      it "assigns the presentation as @presentation" do
        Presentation.stub(:find) { mock_presentation(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:presentation).should be(mock_presentation)
      end

      it "re-renders the 'edit' template" do
        Presentation.stub(:find) { mock_presentation(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    
     before do
        require_admin
     end
     
    it "destroys the requested presentation" do
      Presentation.should_receive(:find).with("37") { mock_presentation }
      mock_presentation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the presentations list" do
      Presentation.stub(:find) { mock_presentation }
      delete :destroy, :id => "1"
      response.should redirect_to(presentations_url)
    end
  end

end
