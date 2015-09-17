class AddClienteIdToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :cliente_id, :integer
  end
end
