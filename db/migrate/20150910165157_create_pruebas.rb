class CreatePruebas < ActiveRecord::Migration
  def change
    create_table :pruebas do |t|
      t.string :clave
      t.string :nombre

      t.timestamps
    end
  end
end
