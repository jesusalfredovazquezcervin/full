class AddPerson1ToNotification < ActiveRecord::Migration
  def change
    remove_column :notifications, :contacto_id
    add_reference :notifications, :person, index: true
    add_reference :notifications, :recipient, index: true

  end


end
