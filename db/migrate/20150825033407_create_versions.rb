class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.text :description
      t.boolean :is_pubile
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
