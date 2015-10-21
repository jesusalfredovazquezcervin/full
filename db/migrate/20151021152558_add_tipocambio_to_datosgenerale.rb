class AddTipocambioToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :tipocambio, :boolean
  end
end
