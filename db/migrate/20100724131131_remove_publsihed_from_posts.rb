class RemovePublsihedFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :publsihed
    add_column :posts, :published, :boolean
  end

  def self.down
    add_column :posts, :published
    remove_column :posts, :published
  end
end
