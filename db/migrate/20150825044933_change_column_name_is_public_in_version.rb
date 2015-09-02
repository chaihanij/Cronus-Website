class ChangeColumnNameIsPublicInVersion < ActiveRecord::Migration
  def change
    rename_column :versions, :is_pubile, :is_public
  end
end
