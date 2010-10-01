class Presentation < ActiveRecord::Base
  

  validates :title,  :presence=>true, :uniqueness=>true
  validates :body, :presence=>true
  validates :event_id, :presence=>true
  validates :speaker_link, :link=>true, :if=>:has_speaker_link
  validates :link, :link=>true , :if=>:has_link

  has_friendly_id :title, :use_slug => true  
  belongs_to :event
  has_many :attachments, :as => 'attachable', :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true 
  
  private
  
  def has_link
    if self.link and !self.link.blank?
      return true
    end
  end
  
  def has_speaker_link
    if self.speaker_link and !self.speaker_link.blank?
      return true
    end 
  end
  
  
  
  
end