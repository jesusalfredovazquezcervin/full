class CreateAgendaAccounts < ActiveRecord::Migration
  def change
    create_table :agenda_accounts do |t|
      t.references :agenda, index: true
      t.references :datosgenerale, index: true

      t.timestamps
    end
  end
end
