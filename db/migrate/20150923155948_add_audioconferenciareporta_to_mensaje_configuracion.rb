class AddAudioconferenciareportaToMensajeConfiguracion < ActiveRecord::Migration
  def change
    add_column :mensaje_configuracions, :audioconferenciaReporta, :boolean
  end
end
