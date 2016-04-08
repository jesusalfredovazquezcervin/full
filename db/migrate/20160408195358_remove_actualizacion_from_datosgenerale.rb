class RemoveActualizacionFromDatosgenerale < ActiveRecord::Migration
  def change
    remove_column :datosgenerales, :actualizacion
  end
end
