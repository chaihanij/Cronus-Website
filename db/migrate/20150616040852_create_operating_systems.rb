class CreateOperatingSystems < ActiveRecord::Migration
   def self.up
    create_table :operating_systems do |t|
      t.string :name
      t.string :version
      t.text :description
      t.boolean :is_public

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :operating_systems
  end 
end
