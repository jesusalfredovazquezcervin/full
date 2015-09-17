class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.integer :cliente_id
      t.string :nombre
      t.string :telefono
      t.string :ext
      t.string :cel
      t.string :email
      t.string :puesto

      t.timestamps
    end
  end
end
