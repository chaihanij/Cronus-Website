class AddAvatarFingerprintColumnToPackageFile < ActiveRecord::Migration
  def up
    add_column :package_files, :package_fingerprint, :string
  end

  def down
    remove_column :package_files, :package_fingerprint
  end
end
