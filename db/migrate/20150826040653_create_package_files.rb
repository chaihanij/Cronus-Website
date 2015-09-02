class CreatePackageFiles < ActiveRecord::Migration
  def change
    create_table :package_files do |t|
      t.attachment :package
      t.date :build_date
      t.date :release_date
      t.references :version, index: true, foreign_key: true
      t.references :operating_system, index: true, foreign_key: true
      t.boolean :is_public

      t.timestamps null: false
    end
  end
end
