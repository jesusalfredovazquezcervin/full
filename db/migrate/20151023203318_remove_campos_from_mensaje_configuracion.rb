class RemoveCamposFromMensajeConfiguracion < ActiveRecord::Migration
  def change
    change_table :mensaje_configuracions do |t|
      t.remove :cliente
      t.remove :rt
      t.remove :fecha
      t.remove :destinatario
      t.remove :remitente
      t.remove :telefono
      t.remove :ciudadEstado
      t.remove :municipio
      t.remove :email
      t.remove :motivoLlamada
      t.remove :accionRealizada
      t.remove :observaciones
      t.remove :direccion


    end
  end

end
