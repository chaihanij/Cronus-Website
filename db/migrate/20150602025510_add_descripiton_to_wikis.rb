class AddDescripitonToWikis < ActiveRecord::Migration
  def self.up
    add_column :wikis, :description, :string
  end
  def self.down
    drop_column :wikis, :description
  end
end
