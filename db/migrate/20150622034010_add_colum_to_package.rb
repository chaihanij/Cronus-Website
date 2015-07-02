class AddColumToPackage < ActiveRecord::Migration
  def self.up
   	add_column :packages, :checksum, :string
   	add_column :packages, :release_date, :date
   	add_column :packages, :build_date, :date
   	add_column :packages, :description, :text
  end

  def self.down
  	drop_column :packages, :checksum
   	drop_column :packages, :release_date
   	drop_column :packages, :build_date
   	drop_column :packages, :description
  end
end
