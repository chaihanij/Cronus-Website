class StorelongWikicolunmBody < ActiveRecord::Migration
  def change
  	    change_column :wikis, :body, :text, :limit => 4294967295
  end
end
