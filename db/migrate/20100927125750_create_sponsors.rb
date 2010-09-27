class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors, :force => true do |t|
      t.string :name
      t.text   :description
      t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end