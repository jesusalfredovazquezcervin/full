class CreateContactClients < ActiveRecord::Migration
  def change
    create_table :contact_clients do |t|
      t.references :contacto, index: true, foreign_key: true
      t.references :cliente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
