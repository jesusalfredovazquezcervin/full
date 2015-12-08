class AddTipocambioupdatedAtToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :tipocambio_updated_at, :datetime
  end
end
