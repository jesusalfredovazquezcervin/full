class CreateDatosgenerales < ActiveRecord::Migration
  def change
    create_table :datosgenerales do |t|
      t.date :alta
      t.date :actualizacion
      t.string :clavesalida
      t.string :locacion
      t.string :did
      t.string :telenrutados
      t.integer :contacto1_id
      t.integer :contacto2_id
      t.integer :contacto3_id
      t.integer :contacto4_id
      t.integer :contacto5_id
      t.string :telefono1
      t.string :telefono2
      t.string :telefono3
      t.string :telefono4
      t.string :telefono5
      t.string :fax
      t.string :giro
      t.string :procedimiento
      t.string :paginaweb

      t.timestamps
    end
  end
end
