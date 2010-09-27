class Attachment < ActiveRecord::Base

  has_attached_file :file
  belongs_to :attachable, :polymorphic => true
  
  
  validates :file_file_name,  :presence=>true
  validates :attachable_id, :presence=>true
  validates :attachable_type, :presence=>true
  

end

