class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :description
      t.attachment :document
      t.boolean :is_public
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
