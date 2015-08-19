class UpdateDocument < ActiveRecord::Migration
  def self.up
  	add_column :documents, :parent_id, :integer, :null => true, :index => true
  	add_column :documents, :lft, :integer, :null => false, :index => true
  	add_column :documents, :rgt, :integer, :null => false, :index => true
    add_column :documents, :depth, :integer, :null => false, :default => 0
    add_column :documents, :children_count, :integer, :null => false, :default => 0
  end

  def self.down
    drop_column :documents, :parent_id
  	drop_column :documents, :lft
  	drop_column :documents, :rgt
    drop_column :documents, :depth
    drop_column :documents, :children_count
  end
end