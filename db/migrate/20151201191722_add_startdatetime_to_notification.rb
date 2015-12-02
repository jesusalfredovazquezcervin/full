class AddStartdatetimeToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :startdatetime, :datetime
    add_column :notifications, :duedatetime, :datetime
  end
end
