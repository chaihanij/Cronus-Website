class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.references :product, index: true, foreign_key: true
      t.references :operating_system, index: true, foreign_key: true
      t.string :name
      t.string :version
      t.attachment :package
      t.attachment :release_note
      t.boolean :release_package
      t.boolean :emergency_package
      t.boolean :notwork_package
      t.boolean :is_public

      t.timestamps null: false
    end
   
  end

  def self.down
    drop_table :packages
  end
end
