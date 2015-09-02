class AddChecksumToPackageFile < ActiveRecord::Migration
  def up
    add_column :package_files, :checksum, :string
  end

  def down
    remove_column :package_files, :checksum
  end
end
