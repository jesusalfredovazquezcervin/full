class CreateContactAccounts < ActiveRecord::Migration
  def change
    create_table :contact_accounts do |t|
      t.integer :contacto_id
      t.integer :datosgenerale_id

      t.timestamps
    end
  end
end
