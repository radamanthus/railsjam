class AddFieldsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :starts_at, :datetime
    add_column :events, :ends_at,   :datetime
    add_column :events, :location,  :string
    add_column :events, :school,    :string
    add_column :events, :details,   :text
    add_column :events, :user_id,   :integer
  end

  def self.down
    remove_column :events, :starts_at
    remove_column :events, :ends_at
    remove_column :events, :location
    remove_column :events, :school
    remove_column :events, :details
    remove_column :events, :user_id
  end
end
