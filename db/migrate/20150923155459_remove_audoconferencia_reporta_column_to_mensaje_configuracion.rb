class RemoveAudoconferenciaReportaColumnToMensajeConfiguracion < ActiveRecord::Migration
  def change
    remove_column :mensaje_configuracions, :audoconferenciaReporta, :boolean
  end
end
