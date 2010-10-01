class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations, :force => true do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :title
      t.string  :link
      t.string  :speaker_name
      t.string  :speaker_link 
      t.text   :body
      t.timestamps
    end
    add_index :presentations, :event_id
    add_index :presentations, :user_id
  end

  def self.down
    drop_table :presentations
  end
end