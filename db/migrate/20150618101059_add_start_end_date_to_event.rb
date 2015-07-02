class AddStartEndDateToEvent < ActiveRecord::Migration
  def self.up
   	add_column :events, :start_date, :date
   	add_column :events, :end_date, :date
  end

  def self.down
  	drop_column :events, :start_date, :date
   	drop_column :events, :end_date, :date
  end
end
