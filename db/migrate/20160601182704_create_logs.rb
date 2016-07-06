class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :usuario, index: true
      t.string :action
      t.string :detail
      t.string :field

      t.timestamps
    end
  end
end
