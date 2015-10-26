class RemoveTicketFromCaptures < ActiveRecord::Migration
  def change
    remove_column :captures, :ticket, :boolean
    remove_column :captures, :para, :boolean
    remove_column :captures, :hora, :boolean
    add_column :captures, :ticket, :string
    add_column :captures, :compania, :string
    add_column :captures, :polizaContrato, :string
    add_column :captures, :descripcionEmergencia, :string
    add_column :captures, :identificarSistema, :string
    add_column :captures, :referencia, :string
    add_column :captures, :comentariosExtra, :string
    add_column :captures, :avisoNombre, :string
    add_column :captures, :avisoFechaHora, :datetime
    add_column :captures, :notificoNombre, :string
    add_column :captures, :notificoFechaHora, :datetime
    add_column :captures, :rllsOperador, :string
    add_column :captures, :rllsFechaHora, :datetime
    add_column :captures, :tiempoRespuesta, :time
    add_column :captures, :notificacionLlegadaSitio, :string
    add_column :captures, :rteOperador, :string
    add_column :captures, :rteFechaHora, :datetime
    add_column :captures, :situacionEmergencia, :string
    add_column :captures, :duracionEmeregencia, :interval
    add_column :captures, :faltaSuministroGas, :string
    #add_reference :sucursal, index: true
    add_column :captures, :tipoLlamada, :string
    add_column :captures, :codigo, :string
    add_column :captures, :horaEnlace, :datetime
    add_column :captures, :medioSeEntero, :string
    add_column :captures, :terminoChat, :datetime
    add_column :captures, :razaMascota, :string
    add_column :captures, :edad, :interval
    add_column :captures, :codigoAcceso, :integer
    add_column :captures, :codigoOrganizador, :integer
    add_column :captures, :fijoMovil, :string
    add_column :captures, :telefonoOrigen, :integer
    add_column :captures, :paisOrigino, :string
    add_column :captures, :localidadOrigino, :string
    add_column :captures, :motivoDenuncia, :string
    add_column :captures, :tipoDelito, :string
    add_column :captures, :puestoInvolucrado, :string
    add_column :captures, :resultadoEstatus, :string
    add_column :captures, :emailContacto, :string
    add_column :captures, :marca, :string
    add_column :captures, :modelo, :string
    add_column :captures, :serie, :string
    add_column :captures, :beneficiario, :string
    add_column :captures, :contactoBeneficiario, :string
    add_column :captures, :nombreFiado, :string
    add_column :captures, :puestoFiado, :string
    add_column :captures, :montoReportar, :decimal, precision: 7, scale: 2
    add_column :captures, :enlazadaCorrectamente, :string
    add_column :captures, :intentosEnlace, :integer
    add_column :captures, :duracionLlamada, :interval
    add_column :captures, :origenCodigoGami, :string
    add_column :captures, :codigoGami, :string
    add_column :captures, :tipoEmergencia, :string
    add_column :captures, :empresaCodigoGami, :string
    add_column :captures, :nomenclaturaSistema, :string
    add_column :captures, :personaRecibe, :string
    add_column :captures, :razonSocial, :string
    add_column :captures, :rfc, :string
    add_column :captures, :ticketCliente, :string
    add_column :captures, :relacionPaciente, :string
    add_column :captures, :lugarTumor, :string
    add_column :captures, :institucionAtiende, :string
    add_column :captures, :medicoTratante, :string
    add_column :captures, :programaInteres, :string
    add_column :captures, :club, :string
    add_column :captures, :handicap, :string
    add_column :captures, :redConecta, :string
    add_column :captures, :intensidadSenal, :string
    add_column :captures, :ubicacionFisica, :string
    add_column :captures, :ipv4, :string
    add_column :captures, :macAddress, :string
    add_column :captures, :hotel, :string
    add_column :captures, :habitacion, :string
    add_column :captures, :usuario, :string
    add_column :captures, :contrasena, :string
    add_column :captures, :tiempoContrato, :interval
    add_column :captures, :dispositivo, :string
    add_column :captures, :acuse, :string
    add_column :captures, :fechaCirugia, :datetime
    add_column :captures, :hospital, :string
    add_column :captures, :tipoCirugia, :string
    add_column :captures, :especidalidad, :string
    add_column :captures, :paciente, :string
    add_column :captures, :cargoPersona, :string
    add_column :captures, :telefonoMedico, :string
    add_column :captures, :equipoEspecial, :string
    add_column :captures, :telefonoPaciente, :string
    add_column :captures, :procedimiento, :string
    add_column :captures, :fechaProcedimiento, :datetime
    add_column :captures, :equipoDetenido, :string
    add_column :captures, :fianza, :string
    add_column :captures, :inclusion, :string
    add_column :captures, :codigoSeguridad, :string
    add_column :captures, :numeroControl, :string
    add_column :captures, :lineaValidacion, :string
    add_column :captures, :tipoPoliza, :string
    add_column :captures, :telefonoFiado, :string
    add_column :captures, :direccionFiado, :string
    add_column :captures, :lugarFianza, :string
    add_column :captures, :vendedorFianza, :string
    add_column :captures, :formaPagoFianza, :string
    add_column :captures, :audioconferenciaReporta, :string
    add_reference :captures, :sucursal, :index => true
  end
end
