require 'spec_helper'

describe PagesController do
  
  render_views
  #fixtures :pages
  fixtures :roles
  fixtures :roles_users
  fixtures :users
  setup :activate_authlogic
  
  def mock_page(stubs={})
    @mock_page ||= mock_model(Page, stubs).as_null_object
  end

  describe "GET index" do
     before do
        require_admin
     end
    it "assigns all pages as @pages" do
      Page.stub(:all) { [mock_page] }
      get :index
      assigns(:pages).should eq([mock_page])
    end
  end

  describe "GET show" do
    it "assigns the requested page as @page" do
      Page.stub(:find).with("37") { mock_page }
      get :show, :id => "37"
      assigns(:page).should be(mock_page)
    end
  end

  describe "GET new" do
    
      before do
        require_admin
     end
     
    it "assigns a new page as @page" do
      Page.stub(:new) { mock_page }
      get :new
      assigns(:page).should be(mock_page)
    end
  end

  describe "GET edit" do
    
     before do
        require_admin
     end
     
     
    it "assigns the requested page as @page" do
      Page.stub(:find).with("37") { mock_page }
      get :edit, :id => "37"
      assigns(:page).should be(mock_page)
    end
  end

  describe "POST create" do
      before do
        require_admin
     end

    describe "with valid params" do
      
      it "assigns a newly created page as @page" do
        Page.stub(:new).with({'these' => 'params'}) { mock_page(:save => true) }
        post :create, :page => {'these' => 'params'}
        assigns(:page).should be(mock_page)
      end

      it "redirects to the created page" do
        Page.stub(:new) { mock_page(:save => true) }
        post :create, :page => {}
        response.should redirect_to(page_url(mock_page))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page as @page" do
        Page.stub(:new).with({'these' => 'params'}) { mock_page(:save => false) }
        post :create, :page => {'these' => 'params'}
        assigns(:page).should be(mock_page)
      end

      it "re-renders the 'new' template" do
        Page.stub(:new) { mock_page(:save => false) }
        post :create, :page => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
    
      before do
        require_admin
     end

    describe "with valid params" do
      it "updates the requested page" do
        Page.should_receive(:find).with("37") { mock_page }
        mock_page.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :page => {'these' => 'params'}
      end

      it "assigns the requested page as @page" do
        Page.stub(:find) { mock_page(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:page).should be(mock_page)
      end

      it "redirects to the page" do
        Page.stub(:find) { mock_page(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(page_url(mock_page))
      end
    end

    describe "with invalid params" do
      it "assigns the page as @page" do
        Page.stub(:find) { mock_page(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:page).should be(mock_page)
      end

      it "re-renders the 'edit' template" do
        Page.stub(:find) { mock_page(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    
     before do
        require_admin
     end
     
    it "destroys the requested page" do
      Page.should_receive(:find).with("37") { mock_page }
      mock_page.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pages list" do
      Page.stub(:find) { mock_page }
      delete :destroy, :id => "1"
      response.should redirect_to(pages_url)
    end
  end

end
