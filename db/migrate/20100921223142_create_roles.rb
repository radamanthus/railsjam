class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :title
    end
    create_table :roles_users, :id => false do |t|
      t.integer :role_id, :user_id
    end
    add_index :roles_users, :role_id
    add_index :roles_users, :user_id
    
    ["admin", "member"].each do |u|
      Role.create!(:title=>u)
    end
    
    #assign member to all
    member_role = Role.where(:title=>"member")[0]
    User.all.each do |p|
      p.roles << member_role
    end

    #make first user an admin 
    admin_role = Role.where(:title=>"admin")[0]
    User.first.roles << admin_role 
    
  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end
end