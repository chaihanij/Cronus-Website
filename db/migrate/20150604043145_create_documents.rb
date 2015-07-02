class CreateDocuments < ActiveRecord::Migration

  def self.up
    create_table :documents do |t|
      t.attachment :documnet

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :documents
  end
end
