class Sponsor < ActiveRecord::Base
  
  validates :name , :presence=>true, :uniqueness=>true
  validates :description, :presence=>true
  validates :link, :presence=>true, :link=>true
  
  has_many :photos, :as => 'photoable', :dependent => :destroy
  
end