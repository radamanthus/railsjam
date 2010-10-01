class Event < ActiveRecord::Base
  
  
  has_many :users, :through => :attendees
  has_many :attendees
  has_many :presentations 
  has_friendly_id :name, :use_slug => true
  
  
end
