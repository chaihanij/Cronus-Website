class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.string :title
      t.string :description
      t.text :body
      t.attachment :image
      t.string :email

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :announcements
  end
end
