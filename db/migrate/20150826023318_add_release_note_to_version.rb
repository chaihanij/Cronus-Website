class AddReleaseNoteToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :release_note_file_name, :string, limit: 255
    add_column :versions, :release_note_content_type, :string, limit: 255
    add_column :versions, :release_note_file_size,:integer, limit: 4
    add_column :versions, :release_note_updated_at, :datetime
    add_column :versions, :release_note_fingerprint, :string 
  end
end
