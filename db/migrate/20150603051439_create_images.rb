class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :title
      t.string :alt
      t.attachment :imageFile, null: false

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :images
  end
end
