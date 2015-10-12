class MensajeConfiguracionsController < ApplicationController
  before_action :set_mensaje_configuracion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /mensaje_configuracions
  # GET /mensaje_configuracions.json
  def index
    @mensaje_configuracions = MensajeConfiguracion.all
    dashboard_4
  end

  # GET /mensaje_configuracions/1
  # GET /mensaje_configuracions/1.json
  def show
    dashboard_4
  end

  # GET /mensaje_configuracions/new
  def new
    @mensaje_configuracion = MensajeConfiguracion.new
    dashboard_4
  end

  # GET /mensaje_configuracions/1/edit
  def edit
    dashboard_4
  end

  # POST /mensaje_configuracions
  # POST /mensaje_configuracions.json
  def create
    @mensaje_configuracion = MensajeConfiguracion.new()
    @mensaje_configuracion.cliente_id = params[:post][:cliente_id]
    @mensaje_configuracion.cliente=params[:mensaje_configuracion][:cliente]
    @mensaje_configuracion.ticket=params[:mensaje_configuracion][:ticket]
    @mensaje_configuracion.rt=params[:mensaje_configuracion][:rt]
    @mensaje_configuracion.fecha=params[:mensaje_configuracion][:fecha]
    @mensaje_configuracion.destinatario=params[:mensaje_configuracion][:destinatario]
    @mensaje_configuracion.remitente=params[:mensaje_configuracion][:remitente]
    @mensaje_configuracion.compania=params[:mensaje_configuracion][:compania]
    @mensaje_configuracion.telefono=params[:mensaje_configuracion][:telefono]
    @mensaje_configuracion.ciudadEstado=params[:mensaje_configuracion][:ciudadEstado]
    @mensaje_configuracion.municipio=params[:mensaje_configuracion][:municipio]
    @mensaje_configuracion.email=params[:mensaje_configuracion][:email]
    @mensaje_configuracion.motivoLlamada=params[:mensaje_configuracion][:motivoLlamada]
    @mensaje_configuracion.accionRealizada=params[:mensaje_configuracion][:accionRealizada]
    @mensaje_configuracion.observaciones=params[:mensaje_configuracion][:observaciones]
    @mensaje_configuracion.polizaContrato=params[:mensaje_configuracion][:polizaContrato]
    @mensaje_configuracion.direccion=params[:mensaje_configuracion][:direccion]
    @mensaje_configuracion.descripcionEmergencia=params[:mensaje_configuracion][:descripcionEmergencia]
    @mensaje_configuracion.identificarSistema=params[:mensaje_configuracion][:identificarSistema]
    @mensaje_configuracion.referencia=params[:mensaje_configuracion][:referencia]
    @mensaje_configuracion.comentariosExtra=params[:mensaje_configuracion][:comentariosExtra]
    @mensaje_configuracion.avisoNombre=params[:mensaje_configuracion][:avisoNombre]
    @mensaje_configuracion.avisoFecha=params[:mensaje_configuracion][:avisoFecha]
    @mensaje_configuracion.notificoNombre=params[:mensaje_configuracion][:notificoNombre]
    @mensaje_configuracion.notificoFechaHora=params[:mensaje_configuracion][:notificoFechaHora]
    @mensaje_configuracion.rllsOperador=params[:mensaje_configuracion][:rllsOperador]
    @mensaje_configuracion.rllsFechaHora=params[:mensaje_configuracion][:rllsFechaHora]
    @mensaje_configuracion.tiempoRespuesta=params[:mensaje_configuracion][:tiempoRespuesta]
    @mensaje_configuracion.notificacionLlegadaSitio=params[:mensaje_configuracion][:notificacionLlegadaSitio]
    @mensaje_configuracion.rteOperador=params[:mensaje_configuracion][:rteOperador]
    @mensaje_configuracion.rteFechaHora=params[:mensaje_configuracion][:rteFechaHora]
    @mensaje_configuracion.situacionEmergencia=params[:mensaje_configuracion][:situacionEmergencia]
    @mensaje_configuracion.duracionEmeregencia=params[:mensaje_configuracion][:duracionEmeregencia]
    @mensaje_configuracion.faltaSuministroGas=params[:mensaje_configuracion][:faltaSuministroGas]
    @mensaje_configuracion.sucursal=params[:mensaje_configuracion][:sucursal]
    @mensaje_configuracion.tipoLlamada=params[:mensaje_configuracion][:tipoLlamada]
    @mensaje_configuracion.codigo=params[:mensaje_configuracion][:codigo]
    @mensaje_configuracion.horaEnlace=params[:mensaje_configuracion][:horaEnlace]
    @mensaje_configuracion.medioSeEntero=params[:mensaje_configuracion][:medioSeEntero]
    @mensaje_configuracion.terminoChat=params[:mensaje_configuracion][:terminoChat]
    @mensaje_configuracion.razaMascota=params[:mensaje_configuracion][:razaMascota]
    @mensaje_configuracion.edad=params[:mensaje_configuracion][:edad]
    @mensaje_configuracion.codigoAcceso=params[:mensaje_configuracion][:codigoAcceso]
    @mensaje_configuracion.codigoOrganizador=params[:mensaje_configuracion][:codigoOrganizador]
    @mensaje_configuracion.fijoMovil=params[:mensaje_configuracion][:fijoMovil]
    @mensaje_configuracion.telefonoOrigen=params[:mensaje_configuracion][:telefonoOrigen]
    @mensaje_configuracion.audioconferenciaReporta=params[:mensaje_configuracion][:audioconferenciaReporta]
    @mensaje_configuracion.paisOrigino=params[:mensaje_configuracion][:paisOrigino]
    @mensaje_configuracion.localidadOrigino=params[:mensaje_configuracion][:localidadOrigino]
    @mensaje_configuracion.motivoDenuncia=params[:mensaje_configuracion][:motivoDenuncia]
    @mensaje_configuracion.tipoDelito=params[:mensaje_configuracion][:tipoDelito]
    @mensaje_configuracion.puestoInvolucrado=params[:mensaje_configuracion][:puestoInvolucrado]
    @mensaje_configuracion.resultadoEstatus=params[:mensaje_configuracion][:resultadoEstatus]
    @mensaje_configuracion.emailContacto=params[:mensaje_configuracion][:emailContacto]
    @mensaje_configuracion.marca=params[:mensaje_configuracion][:marca]
    @mensaje_configuracion.modelo=params[:mensaje_configuracion][:modelo]
    @mensaje_configuracion.serie=params[:mensaje_configuracion][:serie]
    @mensaje_configuracion.beneficiario=params[:mensaje_configuracion][:beneficiario]
    @mensaje_configuracion.contactoBeneficiario=params[:mensaje_configuracion][:contactoBeneficiario]
    @mensaje_configuracion.nombreFiado=params[:mensaje_configuracion][:nombreFiado]
    @mensaje_configuracion.puestoFiado=params[:mensaje_configuracion][:puestoFiado]
    @mensaje_configuracion.montoReportar=params[:mensaje_configuracion][:montoReportar]
    @mensaje_configuracion.enlazadaCorrectamente=params[:mensaje_configuracion][:enlazadaCorrectamente]
    @mensaje_configuracion.intentosEnlace=params[:mensaje_configuracion][:intentosEnlace]
    @mensaje_configuracion.duracionLlamada=params[:mensaje_configuracion][:duracionLlamada]
    @mensaje_configuracion.origenCodigoGami=params[:mensaje_configuracion][:origenCodigoGami]
    @mensaje_configuracion.codigoGami=params[:mensaje_configuracion][:codigoGami]
    @mensaje_configuracion.tipoEmergencia=params[:mensaje_configuracion][:tipoEmergencia]
    @mensaje_configuracion.empresaCodigoGami=params[:mensaje_configuracion][:empresaCodigoGami]
    @mensaje_configuracion.nomenclaturaSistema=params[:mensaje_configuracion][:nomenclaturaSistema]
    @mensaje_configuracion.personaRecibe=params[:mensaje_configuracion][:personaRecibe]
    @mensaje_configuracion.razonSocial=params[:mensaje_configuracion][:razonSocial]
    @mensaje_configuracion.rfc=params[:mensaje_configuracion][:rfc]
    @mensaje_configuracion.ticketCliente=params[:mensaje_configuracion][:ticketCliente]
    @mensaje_configuracion.relacionPaciente=params[:mensaje_configuracion][:relacionPaciente]
    @mensaje_configuracion.lugarTumor=params[:mensaje_configuracion][:lugarTumor]
    @mensaje_configuracion.institucionAtiende=params[:mensaje_configuracion][:institucionAtiende]
    @mensaje_configuracion.medicoTratante=params[:mensaje_configuracion][:medicoTratante]
    @mensaje_configuracion.programaInteres=params[:mensaje_configuracion][:programaInteres]
    @mensaje_configuracion.club=params[:mensaje_configuracion][:club]
    @mensaje_configuracion.handicap=params[:mensaje_configuracion][:handicap]
    @mensaje_configuracion.redConecta=params[:mensaje_configuracion][:redConecta]
    @mensaje_configuracion.intensidadSenal=params[:mensaje_configuracion][:intensidadSenal]
    @mensaje_configuracion.ubicacionFisica=params[:mensaje_configuracion][:ubicacionFisica]
    @mensaje_configuracion.ipv4=params[:mensaje_configuracion][:ipv4]
    @mensaje_configuracion.macAddress=params[:mensaje_configuracion][:macAddress]
    @mensaje_configuracion.hotel=params[:mensaje_configuracion][:hotel]
    @mensaje_configuracion.habitacion=params[:mensaje_configuracion][:habitacion]
    @mensaje_configuracion.usuario=params[:mensaje_configuracion][:usuario]
    @mensaje_configuracion.contrasena=params[:mensaje_configuracion][:contrasena]
    @mensaje_configuracion.tiempoContrato=params[:mensaje_configuracion][:tiempoContrato]
    @mensaje_configuracion.dispositivo=params[:mensaje_configuracion][:dispositivo]
    @mensaje_configuracion.acuse=params[:mensaje_configuracion][:acuse]
    @mensaje_configuracion.fechaCirugia=params[:mensaje_configuracion][:fechaCirugia]
    @mensaje_configuracion.hospital=params[:mensaje_configuracion][:hospital]
    @mensaje_configuracion.tipoCirugia=params[:mensaje_configuracion][:tipoCirugia]
    @mensaje_configuracion.especidalidad=params[:mensaje_configuracion][:especidalidad]
    @mensaje_configuracion.paciente=params[:mensaje_configuracion][:paciente]
    @mensaje_configuracion.cargoPersona=params[:mensaje_configuracion][:cargoPersona]
    @mensaje_configuracion.telefonoMedico=params[:mensaje_configuracion][:telefonoMedico]
    @mensaje_configuracion.equipoEspecial=params[:mensaje_configuracion][:equipoEspecial]
    @mensaje_configuracion.telefonoPaciente=params[:mensaje_configuracion][:telefonoPaciente]
    @mensaje_configuracion.procedimiento=params[:mensaje_configuracion][:procedimiento]
    @mensaje_configuracion.fechaProcedimiento=params[:mensaje_configuracion][:fechaProcedimiento]
    @mensaje_configuracion.equipoDetenido=params[:mensaje_configuracion][:equipoDetenido]
    @mensaje_configuracion.fianza=params[:mensaje_configuracion][:fianza]
    @mensaje_configuracion.inclusion=params[:mensaje_configuracion][:inclusion]
    @mensaje_configuracion.codigoSeguridad=params[:mensaje_configuracion][:codigoSeguridad]
    @mensaje_configuracion.numeroControl=params[:mensaje_configuracion][:numeroControl]
    @mensaje_configuracion.lineaValidacion=params[:mensaje_configuracion][:lineaValidacion]
    @mensaje_configuracion.tipoPoliza=params[:mensaje_configuracion][:tipoPoliza]
    @mensaje_configuracion.telefonoFiado=params[:mensaje_configuracion][:telefonoFiado]
    @mensaje_configuracion.direccionFiado=params[:mensaje_configuracion][:direccionFiado]
    @mensaje_configuracion.lugarFianza=params[:mensaje_configuracion][:lugarFianza]
    @mensaje_configuracion.vendedorFianza=params[:mensaje_configuracion][:vendedorFianza]
    @mensaje_configuracion.formaPagoFianza=params[:mensaje_configuracion][:formaPagoFianza]




    respond_to do |format|
      if @mensaje_configuracion.save
        format.html { redirect_to @mensaje_configuracion, notice: 'Mensaje configuracion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mensaje_configuracion }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @mensaje_configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensaje_configuracions/1
  # PATCH/PUT /mensaje_configuracions/1.json
  def update
    respond_to do |format|
      @mensaje_configuracion.cliente_id = params[:post][:cliente_id]
      @mensaje_configuracion.cliente=params[:mensaje_configuracion][:cliente]
      @mensaje_configuracion.ticket=params[:mensaje_configuracion][:ticket]
      @mensaje_configuracion.rt=params[:mensaje_configuracion][:rt]
      @mensaje_configuracion.fecha=params[:mensaje_configuracion][:fecha]
      @mensaje_configuracion.destinatario=params[:mensaje_configuracion][:destinatario]
      @mensaje_configuracion.remitente=params[:mensaje_configuracion][:remitente]
      @mensaje_configuracion.compania=params[:mensaje_configuracion][:compania]
      @mensaje_configuracion.telefono=params[:mensaje_configuracion][:telefono]
      @mensaje_configuracion.ciudadEstado=params[:mensaje_configuracion][:ciudadEstado]
      @mensaje_configuracion.municipio=params[:mensaje_configuracion][:municipio]
      @mensaje_configuracion.email=params[:mensaje_configuracion][:email]
      @mensaje_configuracion.motivoLlamada=params[:mensaje_configuracion][:motivoLlamada]
      @mensaje_configuracion.accionRealizada=params[:mensaje_configuracion][:accionRealizada]
      @mensaje_configuracion.observaciones=params[:mensaje_configuracion][:observaciones]
      @mensaje_configuracion.polizaContrato=params[:mensaje_configuracion][:polizaContrato]
      @mensaje_configuracion.direccion=params[:mensaje_configuracion][:direccion]
      @mensaje_configuracion.descripcionEmergencia=params[:mensaje_configuracion][:descripcionEmergencia]
      @mensaje_configuracion.identificarSistema=params[:mensaje_configuracion][:identificarSistema]
      @mensaje_configuracion.referencia=params[:mensaje_configuracion][:referencia]
      @mensaje_configuracion.comentariosExtra=params[:mensaje_configuracion][:comentariosExtra]
      @mensaje_configuracion.avisoNombre=params[:mensaje_configuracion][:avisoNombre]
      @mensaje_configuracion.avisoFecha=params[:mensaje_configuracion][:avisoFecha]
      @mensaje_configuracion.notificoNombre=params[:mensaje_configuracion][:notificoNombre]
      @mensaje_configuracion.notificoFechaHora=params[:mensaje_configuracion][:notificoFechaHora]
      @mensaje_configuracion.rllsOperador=params[:mensaje_configuracion][:rllsOperador]
      @mensaje_configuracion.rllsFechaHora=params[:mensaje_configuracion][:rllsFechaHora]
      @mensaje_configuracion.tiempoRespuesta=params[:mensaje_configuracion][:tiempoRespuesta]
      @mensaje_configuracion.notificacionLlegadaSitio=params[:mensaje_configuracion][:notificacionLlegadaSitio]
      @mensaje_configuracion.rteOperador=params[:mensaje_configuracion][:rteOperador]
      @mensaje_configuracion.rteFechaHora=params[:mensaje_configuracion][:rteFechaHora]
      @mensaje_configuracion.situacionEmergencia=params[:mensaje_configuracion][:situacionEmergencia]
      @mensaje_configuracion.duracionEmeregencia=params[:mensaje_configuracion][:duracionEmeregencia]
      @mensaje_configuracion.faltaSuministroGas=params[:mensaje_configuracion][:faltaSuministroGas]
      @mensaje_configuracion.sucursal=params[:mensaje_configuracion][:sucursal]
      @mensaje_configuracion.tipoLlamada=params[:mensaje_configuracion][:tipoLlamada]
      @mensaje_configuracion.codigo=params[:mensaje_configuracion][:codigo]
      @mensaje_configuracion.horaEnlace=params[:mensaje_configuracion][:horaEnlace]
      @mensaje_configuracion.medioSeEntero=params[:mensaje_configuracion][:medioSeEntero]
      @mensaje_configuracion.terminoChat=params[:mensaje_configuracion][:terminoChat]
      @mensaje_configuracion.razaMascota=params[:mensaje_configuracion][:razaMascota]
      @mensaje_configuracion.edad=params[:mensaje_configuracion][:edad]
      @mensaje_configuracion.codigoAcceso=params[:mensaje_configuracion][:codigoAcceso]
      @mensaje_configuracion.codigoOrganizador=params[:mensaje_configuracion][:codigoOrganizador]
      @mensaje_configuracion.fijoMovil=params[:mensaje_configuracion][:fijoMovil]
      @mensaje_configuracion.telefonoOrigen=params[:mensaje_configuracion][:telefonoOrigen]
      @mensaje_configuracion.audoconferenciaReporta=params[:audoconferenciaReporta][:audoconferenciaReporta]
      @mensaje_configuracion.paisOrigino=params[:mensaje_configuracion][:paisOrigino]
      @mensaje_configuracion.localidadOrigino=params[:mensaje_configuracion][:localidadOrigino]
      @mensaje_configuracion.motivoDenuncia=params[:mensaje_configuracion][:motivoDenuncia]
      @mensaje_configuracion.tipoDelito=params[:mensaje_configuracion][:tipoDelito]
      @mensaje_configuracion.puestoInvolucrado=params[:mensaje_configuracion][:puestoInvolucrado]
      @mensaje_configuracion.resultadoEstatus=params[:mensaje_configuracion][:resultadoEstatus]
      @mensaje_configuracion.emailContacto=params[:mensaje_configuracion][:emailContacto]
      @mensaje_configuracion.marca=params[:mensaje_configuracion][:marca]
      @mensaje_configuracion.modelo=params[:mensaje_configuracion][:modelo]
      @mensaje_configuracion.serie=params[:mensaje_configuracion][:serie]
      @mensaje_configuracion.beneficiario=params[:mensaje_configuracion][:beneficiario]
      @mensaje_configuracion.contactoBeneficiario=params[:mensaje_configuracion][:contactoBeneficiario]
      @mensaje_configuracion.nombreFiado=params[:mensaje_configuracion][:nombreFiado]
      @mensaje_configuracion.puestoFiado=params[:mensaje_configuracion][:puestoFiado]
      @mensaje_configuracion.montoReportar=params[:mensaje_configuracion][:montoReportar]
      @mensaje_configuracion.enlazadaCorrectamente=params[:mensaje_configuracion][:enlazadaCorrectamente]
      @mensaje_configuracion.intentosEnlace=params[:mensaje_configuracion][:intentosEnlace]
      @mensaje_configuracion.duracionLlamada=params[:mensaje_configuracion][:duracionLlamada]
      @mensaje_configuracion.origenCodigoGami=params[:mensaje_configuracion][:origenCodigoGami]
      @mensaje_configuracion.codigoGami=params[:mensaje_configuracion][:codigoGami]
      @mensaje_configuracion.tipoEmergencia=params[:mensaje_configuracion][:tipoEmergencia]
      @mensaje_configuracion.empresaCodigoGami=params[:mensaje_configuracion][:empresaCodigoGami]
      @mensaje_configuracion.nomenclaturaSistema=params[:mensaje_configuracion][:nomenclaturaSistema]
      @mensaje_configuracion.personaRecibe=params[:mensaje_configuracion][:personaRecibe]
      @mensaje_configuracion.razonSocial=params[:mensaje_configuracion][:razonSocial]
      @mensaje_configuracion.rfc=params[:mensaje_configuracion][:rfc]
      @mensaje_configuracion.ticketCliente=params[:mensaje_configuracion][:ticketCliente]
      @mensaje_configuracion.relacionPaciente=params[:mensaje_configuracion][:relacionPaciente]
      @mensaje_configuracion.lugarTumor=params[:mensaje_configuracion][:lugarTumor]
      @mensaje_configuracion.institucionAtiende=params[:mensaje_configuracion][:institucionAtiende]
      @mensaje_configuracion.medicoTratante=params[:mensaje_configuracion][:medicoTratante]
      @mensaje_configuracion.programaInteres=params[:mensaje_configuracion][:programaInteres]
      @mensaje_configuracion.club=params[:mensaje_configuracion][:club]
      @mensaje_configuracion.handicap=params[:mensaje_configuracion][:handicap]
      @mensaje_configuracion.redConecta=params[:mensaje_configuracion][:redConecta]
      @mensaje_configuracion.intensidadSenal=params[:mensaje_configuracion][:intensidadSenal]
      @mensaje_configuracion.ubicacionFisica=params[:mensaje_configuracion][:ubicacionFisica]
      @mensaje_configuracion.ipv4=params[:mensaje_configuracion][:ipv4]
      @mensaje_configuracion.macAddress=params[:mensaje_configuracion][:macAddress]
      @mensaje_configuracion.hotel=params[:mensaje_configuracion][:hotel]
      @mensaje_configuracion.habitacion=params[:mensaje_configuracion][:habitacion]
      @mensaje_configuracion.usuario=params[:mensaje_configuracion][:usuario]
      @mensaje_configuracion.contrasena=params[:mensaje_configuracion][:contrasena]
      @mensaje_configuracion.tiempoContrato=params[:mensaje_configuracion][:tiempoContrato]
      @mensaje_configuracion.dispositivo=params[:mensaje_configuracion][:dispositivo]
      @mensaje_configuracion.acuse=params[:mensaje_configuracion][:acuse]
      @mensaje_configuracion.fechaCirugia=params[:mensaje_configuracion][:fechaCirugia]
      @mensaje_configuracion.hospital=params[:mensaje_configuracion][:hospital]
      @mensaje_configuracion.tipoCirugia=params[:mensaje_configuracion][:tipoCirugia]
      @mensaje_configuracion.especidalidad=params[:mensaje_configuracion][:especidalidad]
      @mensaje_configuracion.paciente=params[:mensaje_configuracion][:paciente]
      @mensaje_configuracion.cargoPersona=params[:mensaje_configuracion][:cargoPersona]
      @mensaje_configuracion.telefonoMedico=params[:mensaje_configuracion][:telefonoMedico]
      @mensaje_configuracion.equipoEspecial=params[:mensaje_configuracion][:equipoEspecial]
      @mensaje_configuracion.telefonoPaciente=params[:mensaje_configuracion][:telefonoPaciente]
      @mensaje_configuracion.procedimiento=params[:mensaje_configuracion][:procedimiento]
      @mensaje_configuracion.fechaProcedimiento=params[:mensaje_configuracion][:fechaProcedimiento]
      @mensaje_configuracion.equipoDetenido=params[:mensaje_configuracion][:equipoDetenido]
      @mensaje_configuracion.fianza=params[:mensaje_configuracion][:fianza]
      @mensaje_configuracion.inclusion=params[:mensaje_configuracion][:inclusion]
      @mensaje_configuracion.codigoSeguridad=params[:mensaje_configuracion][:codigoSeguridad]
      @mensaje_configuracion.numeroControl=params[:mensaje_configuracion][:numeroControl]
      @mensaje_configuracion.lineaValidacion=params[:mensaje_configuracion][:lineaValidacion]
      @mensaje_configuracion.tipoPoliza=params[:mensaje_configuracion][:tipoPoliza]
      @mensaje_configuracion.telefonoFiado=params[:mensaje_configuracion][:telefonoFiado]
      @mensaje_configuracion.direccionFiado=params[:mensaje_configuracion][:direccionFiado]
      @mensaje_configuracion.lugarFianza=params[:mensaje_configuracion][:lugarFianza]
      @mensaje_configuracion.vendedorFianza=params[:mensaje_configuracion][:vendedorFianza]
      @mensaje_configuracion.formaPagoFianza=params[:mensaje_configuracion][:formaPagoFianza]


      if @mensaje_configuracion.save
        format.html { redirect_to @mensaje_configuracion, notice: 'Mensaje configuracion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @mensaje_configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensaje_configuracions/1
  # DELETE /mensaje_configuracions/1.json
  def destroy
    @mensaje_configuracion.destroy
    respond_to do |format|
      format.html { redirect_to mensaje_configuracions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensaje_configuracion
      @mensaje_configuracion = MensajeConfiguracion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensaje_configuracion_params
      params.require(:mensaje_configuracion).permit(:cliente, :ticket, :rt, :fecha, :destinatario, :remitente, :compania, :telefono, :ciudadEstado, :municipio, :email, :motivoLlamada, :accionRealizada, :observaciones, :polizaContrato, :direccion, :descripcionEmergencia, :identificarSistema, :referencia, :comentariosExtra, :avisoNombre, :avisoFecha, :notificoNombre, :notificoFechaHora, :rllsOperador, :rllsFechaHora, :tiempoRespuesta, :notificacionLlegadaSitio, :rteOperador, :rteFechaHora, :situacionEmergencia, :duracionEmeregencia, :faltaSuministroGas, :sucursal, :tipoLlamada, :codigo, :horaEnlace, :medioSeEntero, :terminoChat, :razaMascota, :edad, :codigoAcceso, :codigoOrganizador, :fijoMovil, :telefonoOrigen, :audioconferenciaReporta, :paisOrigino, :localidadOrigino, :motivoDenuncia, :tipoDelito, :puestoInvolucrado, :resultadoEstatus, :emailContacto, :marca, :modelo, :serie, :beneficiario, :contactoBeneficiario, :nombreFiado, :puestoFiado, :montoReportar, :enlazadaCorrectamente, :intentosEnlace, :duracionLlamada, :origenCodigoGami, :codigoGami, :tipoEmergencia, :empresaCodigoGami, :nomenclaturaSistema, :personaRecibe, :razonSocial, :rfc, :ticketCliente, :relacionPaciente, :lugarTumor, :institucionAtiende, :medicoTratante, :programaInteres, :club, :handicap, :redConecta, :intensidadSenal, :ubicacionFisica, :ipv4, :macAddress, :hotel, :habitacion, :usuario, :contrasena, :tiempoContrato, :dispositivo, :acuse, :fechaCirugia, :hospital, :tipoCirugia, :especidalidad, :paciente, :cargoPersona, :telefonoMedico, :equipoEspecial, :telefonoPaciente, :procedimiento, :fechaProcedimiento, :equipoDetenido, :fianza, :inclusion, :codigoSeguridad, :numeroControl, :lineaValidacion, :tipoPoliza, :telefonoFiado, :direccionFiado, :lugarFianza, :vendedorFianza, :formaPagoFianza, :cliente_id)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
end
