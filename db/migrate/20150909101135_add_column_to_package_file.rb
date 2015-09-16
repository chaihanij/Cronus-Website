class AddColumnToPackageFile < ActiveRecord::Migration
  def change
    add_column :package_files, :description, :text
    add_column :package_files, :emergency_package, :boolean
  end
end