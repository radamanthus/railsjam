class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries, :force => true do |t|
      t.string  :name 
      t.text    :description 
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end