require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gallery do
  before(:each) do
   @gallery = Gallery.new
  end


  describe "new gallery with invalid params" do 
    it "should not be valid when empty" do
      @gallery.should_not be_valid
    end

    ['name', 'description'].each do |field|
      it "should require #{field}" do
        @gallery.should_not be_valid
      end
    end
  end
  
  describe "new gallery with valid params" do
    it "should be valid when having correct information" do
      @gallery.name = "RailsJam 2010"
      @gallery.description = "RailsJam 2010 photos - Manila"
      @gallery.should be_valid
    end
    
  end

  describe "test associations" do
     it { should have_many(:photos) }
  end
  
  
end
