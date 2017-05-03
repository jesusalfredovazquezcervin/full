class CreateScalings < ActiveRecord::Migration
  def change
    create_table :scalings do |t|
      t.references :datosgenerale, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
