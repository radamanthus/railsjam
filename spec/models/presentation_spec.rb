require 'spec_helper'

describe Presentation do
  
  fixtures :roles
  fixtures :roles_users
  fixtures :presentations
  setup :activate_authlogic
  
  before(:each) do
    @presentation = Presentation.new
  end

  describe "presentation" do 

    it "should not be valid when empty" do
      @presentation.should_not be_valid
    end

  
  end


   describe "validate presence of fields for new presentation" do
  
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:body) }
      it { should validate_presence_of(:event_id) }

   end




   describe "assert associations" do

     it { should belong_to(:event) }
     it { should have_many(:attachments) }

   end
   
   
end
