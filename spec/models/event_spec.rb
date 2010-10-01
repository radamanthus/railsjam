require 'spec_helper'

describe Event do
  
  
  
   describe "assert associations" do

     it { should have_many(:users) }
     it { should have_many(:attendees) }
     it { should have_many(:presentations) }

   end
   
  
  
end
