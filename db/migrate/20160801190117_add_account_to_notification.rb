class AddAccountToNotification < ActiveRecord::Migration
  def change
    add_reference :notifications, :datosgenerale, index: true
  end
end
