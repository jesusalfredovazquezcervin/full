class AddClienteIdToMensajeConfiguracion < ActiveRecord::Migration
  def change
    add_column :mensaje_configuracions, :cliente_id, :integer
  end
end
