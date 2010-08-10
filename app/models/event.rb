class Event < ActiveRecord::Base
  has_many :users, :through => :attendees
end
