class AddColumnSlugToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :slug, :string
  end
end
