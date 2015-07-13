class AddPublicToWiki < ActiveRecord::Migration
  def self.up
    add_column :wikis, :is_public, :boolean
  end
  def self.down
  	drop_column :wikis, :is_public
  end
end
