class CreateForm5s < ActiveRecord::Migration
  def change
    create_table :form5s do |t|
      t.integer :cliente_id
      t.integer :usuario_id
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
      t.string :field11
      t.string :field12
      t.string :field13
      t.string :field14
      t.string :field15
      t.string :field16
      t.string :field17
      t.string :field18
      t.string :field19
      t.string :field20

      t.timestamps
    end
  end
end
