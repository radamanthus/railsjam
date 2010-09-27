class Photo  < ActiveRecord::Base
  
  has_attached_file :image
  
  validates :image_file_name, :presence=>true
  validates :image_content_type, :presence=>true
  validates :image_file_size, :presence=>true
  validates :image_updated_at, :presence=>true
  
  belongs_to :photoable, :polymorphic => true

  
end