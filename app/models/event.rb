class Event < ActiveRecord::Base
  
  validates :name, :presence => true
  
  has_many :users, :through => :attendees
  has_many :attendees
  has_friendly_id :name, :use_slug => true

  has_many :photos, :as => 'photoable', :dependent => :destroy
  accepts_nested_attributes_for :photos

  belongs_to :user

end
