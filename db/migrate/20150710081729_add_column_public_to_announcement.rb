class AddColumnPublicToAnnouncement < ActiveRecord::Migration
  def self.up
    add_column :announcements, :is_public, :boolean
  end
  def self.down
  	drop_column :announcements, :is_public, :boolean
  end
end
