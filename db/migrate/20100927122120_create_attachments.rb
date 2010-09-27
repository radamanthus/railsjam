class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments, :force => true do |t|
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.integer :attachable_id
      t.string :attachable_type 
      t.timestamps
    end
    add_index :attachments, :attachable_id
    add_index :attachments, [:file_file_name, :file_content_type, :file_file_size, :attachable_id, :attachable_type], :name => "index_attachments_on_f_a_a", :unique => true
  end

  def self.down
    drop_table :attachments
  end
end