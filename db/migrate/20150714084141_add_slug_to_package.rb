class AddSlugToPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :slug, :string
    add_index :packages, :slug, unique: true
  end
  def self.down
  	remove_index :packages, :slug
    drop_column :packages, :slug
  end
end
