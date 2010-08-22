class AlterAttendees < ActiveRecord::Migration
  def self.up
    add_column :attendees, :years_of_web_programming_experience, :integer, :default => 1
    add_column :attendees, :years_of_programming_experience, :integer, :default => 1
    add_column :attendees, :years_of_ruby_experience, :integer, :default => 1
    add_column :attendees, :years_of_rails_experience, :integer, :default => 1
    add_column :attendees, :current_primary_programming_language, :string
    add_column :attendees, :preferred_os, :string
    add_column :attendees, :preferred_ide, :string
    add_column :attendees, :has_laptop, :boolean, :default => true
  end

  def self.down
    remove_column :attendees, :years_of_web_programming_experience    
    remove_column :attendees, :years_of_programming_experience
    remove_column :attendees, :years_of_ruby_experience
    remove_column :attendees, :years_of_rails_experience
    remove_column :attendees, :current_primary_programming_language
    remove_column :attendees, :preferred_os
    remove_column :attendees, :preferred_ide
    remove_column :attendees, :has_laptop
  end
end
