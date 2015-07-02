class AddSlugToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :slug, :string
    add_index :products, :slug, unique: true
  end
  def self.down
  	remove_index :products, :slug
    drop_column :products, :slug
  end
end
