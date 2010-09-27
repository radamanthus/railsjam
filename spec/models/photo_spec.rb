require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Photo do
  before(:each) do
   @photo = Photo.new
  end


  describe "new gallery with invalid params" do 
    it "should not be valid when empty" do
      @photo.should_not be_valid
    end
    
    it { should validate_presence_of(:image_file_name) }
    it { should validate_presence_of(:image_content_type) }
    it { should validate_presence_of(:image_file_size) }
    it { should validate_presence_of(:image_updated_at) }
  end
  


  describe "test associations" do

  end
  
  
end
