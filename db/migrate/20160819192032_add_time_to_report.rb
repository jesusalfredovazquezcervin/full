class AddTimeToReport < ActiveRecord::Migration
  def change
    add_column :reports, :start_time, :time
    add_column :reports, :end_time, :time
  end
end
