class CreateWikis < ActiveRecord::Migration
 def self.up
    create_table :wikis do |t|
      t.string :title
      t.text  :body
      t.text  :sidebody
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :wikis
  end
end
