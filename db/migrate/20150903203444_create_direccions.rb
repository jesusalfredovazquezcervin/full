class CreateDireccions < ActiveRecord::Migration
  def change
    create_table :direccions do |t|
      t.integer :sucursal_id
      t.string :calle
      t.string :numero
      t.string :colonia
      t.string :delegacion
      t.string :cp
      t.string :telefono
      t.string :referencia
      t.string :mapsgoogle
      t.boolean :matriz

      t.timestamps
    end
  end
end
