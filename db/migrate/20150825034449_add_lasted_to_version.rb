class AddLastedToVersion < ActiveRecord::Migration
  def self.up
    add_column :versions, :latest, :boolean
  end 

  def self.down
    drop_column :versions, :latest 
  end
end
