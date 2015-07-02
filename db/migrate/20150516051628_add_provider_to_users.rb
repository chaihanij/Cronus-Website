class AddProviderToUsers < ActiveRecord::Migration
  def self.up
  	 add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
  def self.down
    drop_colum  :users, :provider, :string
    drop_colum :users, :uid, :string
  end
end
