class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :usuario, index: true
      t.datetime :checkin

      t.timestamps
    end
  end
end
