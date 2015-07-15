class AddMakeLatestPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :latest, :boolean
  end
  def self.down
     drop_column :packages, :latest
  end
end
