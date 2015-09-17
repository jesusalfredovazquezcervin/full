class CreateSucursals < ActiveRecord::Migration
  def change
    create_table :sucursals do |t|
      t.integer :cliente_id
      t.string :nombre
      t.string :telefono
      t.integer :contacto_id

      t.timestamps
    end
  end
end
