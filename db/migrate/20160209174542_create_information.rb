class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.references :form, index: true
      t.references :usuario, index: true
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5
      t.string :field6
      t.string :field7
      t.string :field8
      t.string :field9
      t.string :field10

      t.timestamps
    end
  end
end
