class AddPublicColumnEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :is_public, :boolean
  end
  def self.down
  	drop_column :events, :is_public
  end
end
