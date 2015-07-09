class AddPackageFingerprintColumnToPackage < ActiveRecord::Migration
  def self.up
   	add_column :packages, :package_fingerprint, :string 
  end
  def self.drop
  	drop_column :packages, :package_fingerprint
  end
end
