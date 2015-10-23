class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.integer :cliente_id
      t.string :nombre
      t.string :rfc
      t.string :calle
      t.string :numero
      t.string :colonia
      t.string :delegacion
      t.string :estado
      t.string :cp
      t.string :email
      t.string :telefono
      t.string :cel

      t.timestamps
    end
  end
end
