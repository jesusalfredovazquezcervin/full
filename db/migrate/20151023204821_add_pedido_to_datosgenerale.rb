class AddPedidoToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :pedido, :boolean
  end
end
