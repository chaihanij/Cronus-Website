class CreateProducts < ActiveRecord::Migration

  def self.up
   	create_table :products do |t|
      t.string :name
      t.string :description
      t.boolean :public

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :products
  end
end
