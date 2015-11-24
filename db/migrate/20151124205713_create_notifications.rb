class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :cliente, index: true
      t.references :sucursal, index: true
      t.references :usuario, index: true
      t.references :contacto, index: true
      t.references :status, index: true
      t.references :event, index: true
      t.string :notification
      t.date :startdate
      t.time :starttime
      t.date :duedate
      t.time :duetime

      t.timestamps
    end
  end
end
