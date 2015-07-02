class AddNameToUser < ActiveRecord::Migration
  def self.up
  	 add_column :users, :name, :string
  end
  def self.down
    drop_colum :users, :name, :string
  end
end
