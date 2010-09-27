class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos, :force => true do |t|
      t.integer :photoable_id
      t.string :photoable_type 
      t.string :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
      add_index :photos, :photoable_id
      add_index :photos, :photoable_type 
  end

  def self.down
    drop_table :photos
  end
end