class AddRoleToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :role, :integer
  end
  def self.down
    drop_colum :users, :role
  end
end
