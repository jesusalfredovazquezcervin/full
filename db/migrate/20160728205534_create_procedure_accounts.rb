class CreateProcedureAccounts < ActiveRecord::Migration
  def change
    create_table :procedure_accounts do |t|
      t.references :procedure, index: true
      t.references :datosgenerale, index: true

      t.timestamps
    end
  end
end
