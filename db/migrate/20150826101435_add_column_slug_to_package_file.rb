class AddColumnSlugToPackageFile < ActiveRecord::Migration
  def change
    add_column :package_files, :slug, :string
  end
end
