class AddIndexOnWikis < ActiveRecord::Migration
  def change
    add_index :wikis, :title
    add_index :wikis, :description
  end
end
