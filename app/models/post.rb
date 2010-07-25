class Post < ActiveRecord::Base
  
  validates_presence_of :title, :body, :tags, :published
  has_friendly_id :title, :use_slug => true
  
  def self.promoted
    where(:promoted => true)
  end

end
