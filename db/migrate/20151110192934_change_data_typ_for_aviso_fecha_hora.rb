class ChangeDataTypForAvisoFechaHora < ActiveRecord::Migration
  def change
    remove_column :captures, :avisoFechaHora
    add_column :captures, :avisoFecha, :date
    add_column :captures, :avisoHora, :time

    remove_column :captures, :notificoFechaHora
    add_column :captures, :notificoFecha, :date
    add_column :captures, :notificoHora, :time

    remove_column :captures, :rllsFechaHora
    add_column :captures, :rllsFecha, :date
    add_column :captures, :rllsHora, :time

    remove_column :captures, :rteFechaHora
    add_column :captures, :rteFecha, :date
    add_column :captures, :rteHora, :time

    change_column :captures, :horaEnlace , :time

    remove_column :captures, :terminoChat
    add_column :captures, :terminoChatFecha, :date
    add_column :captures, :terminoChatHora, :time

    change_column :captures, :fechaCirugia, :date
    change_column :captures, :fechaProcedimiento, :date

    remove_column :captures, :tipoDelito
    add_column :captures, :delito, :string

    remove_column :captures, :tipoCirugia
    add_column :captures, :cirugia, :string

    remove_column :captures, :fijoMovil
    add_column :captures, :fijoMovil, :boolean

    remove_column :captures,:enlazadaCorrectamente
    add_column :captures, :enlazadaCorrectamente, :boolean

    remove_column :captures, :acuse
    add_column  :captures, :acuse, :boolean

    remove_column :captures, :equipoDetenido
    add_column  :captures, :equipoDetenido, :boolean





  end
end
