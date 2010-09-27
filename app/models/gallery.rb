class Gallery < ActiveRecord::Base
  
  
  
  validates :name, :presence=>true
  validates :description, :presence=>true
  
  has_many :photos, :as => 'photoable', :dependent => :destroy
  accepts_nested_attributes_for :photos
  has_friendly_id :name, :use_slug => true
  
end