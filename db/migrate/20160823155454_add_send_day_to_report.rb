class AddSendDayToReport < ActiveRecord::Migration
  def change
    add_column :reports, :send_same_day, :boolean
  end
end
