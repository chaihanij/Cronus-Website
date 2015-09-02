class AddColumnProductToPackageFile < ActiveRecord::Migration
  def change
     add_column :package_files, :product_id, :integer
  end
end
