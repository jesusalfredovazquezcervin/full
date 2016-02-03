class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.integer :cliente_id
      t.integer :sucursal_id
      t.string :name

      t.timestamps
    end
  end
end
