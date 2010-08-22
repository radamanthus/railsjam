class Event < ActiveRecord::Base
  
  
  has_many :users, :through => :attendees
  has_friendly_id :name, :use_slug => true
  
  
end
