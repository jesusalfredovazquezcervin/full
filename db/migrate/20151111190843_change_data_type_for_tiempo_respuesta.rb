class ChangeDataTypeForTiempoRespuesta < ActiveRecord::Migration
  def change
    remove_column :captures, :tiempoRespuesta
    add_column  :captures, :tiempoRespuesta, :interval
  end
end
