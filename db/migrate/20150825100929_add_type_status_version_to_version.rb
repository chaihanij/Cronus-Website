class AddTypeStatusVersionToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :release_version, :boolean
    add_column :versions, :emergency_version, :boolean
    add_column :versions, :broken_version, :boolean
  end
end
